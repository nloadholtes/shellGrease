#!/usr/bin/env python

import sys
import subprocess

MAIL_TO = ""
MAIL_FROM = ""

def _send_email(subject, body, emailto=MAIL_TO, emailfrom=MAIL_FROM):
    return None

def _startjob(args):
    """Start up a job"""
    print(args)
    ret_val = subprocess.call(args)
    return ret_val



if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Need a command to run")
        exit(1)

    args = sys.argv[1:]
    print(_startjob(args))
