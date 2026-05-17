rule bwa_mem_CHS_HG00512:
    output:
        "bam/CHS.HG00512.bam"
    input:
        "resources/ref.fa",
        "data/CHS.HG00512_1.fastq.gz",
        "data/CHS.HG00512_2.fastq.gz",
    shell:
        "bwa mem -t 1 {input} | samtools view -b -o {output}"
