rule all:
    input: expand("bam/{sample}.bam", sample=["CHS.HG00512", "PUR.HG00731"])

rule bwa_mem_wildcard:
    output:
        "bam/{sample}.bam"
    input:
        "resources/ref.fa",
        "data/{sample}_1.fastq.gz",
        "data/{sample}_2.fastq.gz",
    conda:
        "envs/bwa.yaml"
    singularity:
        "docker://lh3lh3/bwa"
    envmodules:
        "uppmax",
        "bioinfo-tools",
        "bwa"
    shell:
        "bwa mem -t 1 {input} | samtools view -b -o {output}"
