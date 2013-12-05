#!/usr/bin/env python
#
# clear_to_push.py
#
# Nick Loadholtes <nick@ironboundsoftware.com>
#
# Checks a given Jenkins server to see if the given job(s) are
# red. If they are red, return 1.
#
# This script is intended to be used in a pre-push hook to 
# prevent the user from pushing code at a bad time.
import json
import urllib2
import sys

JENKINS = ""
JENKINS_JOBS = ("job1", "job2")

if __name__ == '__main__':
    req = urllib2.Request("http://" + JENKINS + "/api/json")
    data = json.loads(urllib2.urlopen(req).read())
    for job in data["jobs"]:
        if job["name"] in JENKINS_JOBS:
            if "red" in job["color"].lower():
                print("\t\t!!!!!!!!Jenkins is red: %s!!!!!!!!" % job["name"])
                sys.exit(1)
    sys.exit(0)
