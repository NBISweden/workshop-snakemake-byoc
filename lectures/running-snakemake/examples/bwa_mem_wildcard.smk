rule bwa_mem_wildcard:
    input:
        "resources/ref.fa",
        "data/{sample}_1.fastq.gz",
        "data/{sample}_2.fastq.gz",
    output:
        "bam/{sample}.bam"
    shell:
        """bwa mem -t 1 {input} | \
        samtools view -b -o {output}"""
