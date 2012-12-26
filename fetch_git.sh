#
# fetch_git.sh
# Nick Loadholtes <nick@ironboundsoftware.com>
# Nov 3, 2011
#
# Looks at the directories in the current dir
# and if any of them contain a .git dir it will
# attempt to go a 'git fetch' to pull down anything.
#
for x in $(ls) ; do if [ -d $x/.git ]; then echo "--->Checking $x"; cd $x; git fetch; cd ..; fi; done
