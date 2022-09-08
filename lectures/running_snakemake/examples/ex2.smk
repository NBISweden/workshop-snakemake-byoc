rule bwa_mem_wildcard:
    output:
        "bam/{sample}.bam"
    input:
        "resources/ref.fa",
        "data/{sample}_1.fastq.gz",
        "data/{sample}_2.fastq.gz",
    shell:
        "bwa mem -t 1 {input} | samtools view -b -o {output}"
