#!/usr/bin/env python
#
# clear_to_push.py
#
# Nick Loadholtes <nick@ironboundsoftware.com>
# December 5th, 2013
#
# Checks a given Jenkins server to see if the given job(s) are
# red. If they are red, return 1.
#
# This script is intended to be used in a pre-push hook to
# prevent the user from pushing code at a bad time.
#
# For example, in a .hg/hgrc file you could have an entry
# like this:
#
#       [hooks]
#       pre-push.jenkins = clear_to_push.py 10.0.1.100:7000 project_job
#
# And that will run this script before pushing to ensure that
# project_job is currently not red.
#
import json
import urllib2
import sys

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Usage: clear_to_push.py <jenkins server> <space separated list of jobs to check>")
        sys.exit(-1)
    JENKINS = sys.argv[1]
    JENKINS_JOBS = sys.argv[2:]
    req = urllib2.Request("http://" + JENKINS + "/api/json")
    data = json.loads(urllib2.urlopen(req).read())
    for job in data["jobs"]:
        if job["name"] in JENKINS_JOBS:
            if "red" in job["color"].lower():
                print("\t\t!!!!!!!!Jenkins is red: %s!!!!!!!!" % job["name"])
                sys.exit(1)
    sys.exit(0)
