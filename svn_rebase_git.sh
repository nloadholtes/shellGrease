#
# svn_rebase_git.sh
# Nick Loadholtes <nick@ironboundsoftware.com>
# Jan 3, 2012
#
# Looks at the directories in the current dir
# and if any of them contain a .git dir it will
# attempt to go a 'git svn rebase' to pull down anything from
# the svn repository we are pointed at.
#

for x in $(ls) ; do if [ -d $x/.git ]; then echo "--->Checking $x"; cd $x; git svn rebase ; cd ..; fi; done