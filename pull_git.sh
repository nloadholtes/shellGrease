#
# fetch_git.sh
# Nick Loadholtes <nick@ironboundsoftware.com>
# March 27, 2014
#
# Looks at the directories in the current dir
# and if any of them contain a .git dir it will
# attempt to go a 'git pull' to pull down anything.
#
# The idea is this can be used to quickly bring everything
# up to date as quickly as possible.
#
for x in $(ls) ;
do
    if [ -d $x/.git ]; then
        echo "--->Checking $x";
        cd $x;
        if [[ $1 == "-m" ]]; then
            echo "Switch to master branch";
            git checkout master;
        fi;
        git pull;
        cd ..;
    fi;
done
