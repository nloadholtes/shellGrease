#
# push_git.sh
# Nick Loadholtes <nick@ironboundsoftware.com>
# Nov 3, 2011
#
# Looks at the directories in the current dir
# and if any of them contain a .git dir it will
# attempt to go a 'git push' to push any changes.
#
# Note if your local repo isn't ready to push, you'll
# get the normal git error messages. 
#
for x in `ls` ; do if [ -d $x/.git ]; then echo "--->Pushing $x"; cd $x; git push; cd ..; fi; done
