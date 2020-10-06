#!/usr/bin/env python
import subprocess
import sys

jobid = sys.argv[1]

sacct_cmd = f"sacct -j {jobid} --format State --noheader | head -1 | awk '{{print $1}}'"
output = str(subprocess.check_output(sacct_cmd, shell=True).strip())

running_status = ["PENDING", "CONFIGURING", "COMPLETING",
                  "RUNNING", "SUSPENDED"]
if "COMPLETED" in output:
    print("success")
elif any(r in output for r in running_status):
    print("running")
else:
    print("failed")
