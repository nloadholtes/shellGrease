#!/usr/bin/env python

import sys
import os
import subprocess
from ConfigParser import SafeConfigParser

MAIL_TO = ""
MAIL_FROM = ""

def _send_email(subject, body, parser):
    MAIL_TO = parser.get("MAIL", "mail_to")
    MAIL_FROM = parser.get("MAIL", "mail_from")
    MAIL_SERVER = parser.get("MAIL", "mail_server")
    msg = MIMEMultipart('alternative')
    msg['Subject'] = subject
    msg['From'] = MAIL_FROM
    msg['To'] = MAIL_TO

    msg.attach(MIMEText(body, 'plain'))
    print msg
    smtp = smtplib.SMTP(parser.get("MAIL", "mail_server"),
                        parser.get("MAIL", "mail_port"))
    smtp.ehlo()
    smtp.starttls()
    smtp.ehlo()
    smtp.login(parser.get("MAIL", "login"), parser.get("MAIL", "password"))
    smtp.sendmail('<Job finished notification>%s' % MAIL_FROM,
                  MAIL_TO, msg.as_string())
    smtp.close()

def _startjob(args):
    """Start up a job"""
    print(args)
    ret_val = subprocess.call(args)
    return ret_val


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Need a command to run")
        exit(1)

    parser = SafeConfigParser()
    parser.read(os.path.expanduser('~/shellGrease.ini'))
    args = sys.argv[1:]
    print(_startjob(args))
    _send_email("Quick test", _startjob(args), parser)
