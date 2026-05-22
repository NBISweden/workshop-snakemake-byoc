CHROMOSOMES = ["chr1", "chr2", "chr3", "chr4"]


rule all:
    input:
        expand("results/{chromosome}/variants.vcf", chromosome=CHROMOSOMES),


rule call_variants:
    input:
        bam="data/{chromosome}/aligned.bam",
        reference="reference/genome.fa",
    output:
        vcf="results/{chromosome}/variants.vcf",
    log:
        "logs/data/{chromosome}/aligned.bam.log",
    conda:
        "envs/variant_calling.yaml"
    shell:
        """
        # Placeholder command for variant calling
        echo "Calling variants for {input.bam} against {input.reference}" > {output.vcf}
        """
