rule all:
    input: "bam/merged.bam"

rule bwa_mem_wildcard:
    output:
        "bam/{sample}.bam",
        "bam/{sample}.bam.bai"
    input:
        "resources/ref.fa",
        "data/{sample}_1.fastq.gz",
        "data/{sample}_2.fastq.gz",
    threads: 2
    log: "logs/bam/{sample}.bam.log"
    shell:
        "bwa mem -t {threads} {input} 2> {log} | samtools sort --write-index -@{threads} - -o {output[0]}##idx##{output[1]} 2>> {log}"


rule samtools_merge_bam:
    output:
        "bam/merged.bam",
    input:
        bam = expand("bam/{sample}.bam", sample=["CHS.HG00512", "PUR.HG00731"]),
        bai = expand("bam/{sample}.bam.bai", sample=["CHS.HG00512", "PUR.HG00731"]),
    threads: 2
    log: "logs/bam/merged.bam.log"
    resources:
        mem_mb=4000
    shell:
        "samtools merge -@{threads} {output} {input.bam} 2> {log}"
