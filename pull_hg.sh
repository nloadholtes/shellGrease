#
# pull_hg.sh
# Nick Loadholtes <nick@ironboundsoftware.com>
# Dec 29, 2011
#
# Looks at the directories in the current dir
# and if any of them contain a .hg dir it will
# attempt to go a 'hg pull' to pull down anything.
#
for x in `ls` ; do if [ -d $x/.hg ]; then echo "--->Checking $x"; cd $x; hg pull $1; cd ..; fi; done
