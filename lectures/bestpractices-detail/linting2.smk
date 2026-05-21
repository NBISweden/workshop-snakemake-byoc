CHROMOSOMES = ["chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21", "chr22"]

rule all:
    input:
        expand("results/{chromosome}/variants.vcf", chromosome=CHROMOSOMES)

rule call_variants:
    output:
        vcf="results/{chromosome}/variants.vcf"
    input:
        bam="data/{chromosome}/aligned.bam",
        reference="reference/genome.fa"
    log:
        "logs/data/{chromosome}/aligned.bam.log"
    shell:
        """
        # Placeholder command for variant calling
        echo "Calling variants for {input.bam} against {input.reference}" > {output.vcf}
        """
