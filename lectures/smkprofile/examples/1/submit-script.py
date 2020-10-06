#!/usr/bin/env python3
import os
import sys
import json

from snakemake.utils import read_job_properties

jobscript = sys.argv[1]
job_properties = read_job_properties(jobscript)
# Use at least two threads
threads = max(job_properties["threads"], 2)
sbatch_opts = "--parsable -t 1 -p devel"
os.system(f"sbatch {sbatch_opts} -A $ACCOUNT -n {threads} {jobscript}")

## Save some objects to see what's going on
with open("submit-script.log", "w") as fh:
    fh.write(f"sbatch {sbatch_opts} -A $ACCOUNT -n {threads} {jobscript}\n\n")
    fh.write(f"{jobscript}\n\n")
    fh.write(f"{json.dumps(job_properties)}\n")
