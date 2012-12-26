#
# Goes through each of the sub directories and runs
# svn up
# to update the projects. This script should be run
# manually to let you handle any merge/conflit issues
# that might crop up.
#
# Nick Loadholtes, 2/14/2011

for x in $(ls);  do echo $x; cd $x; svn up; cd ..; done;
