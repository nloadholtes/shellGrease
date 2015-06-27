#
# cleanup_git.sh
#
# Util to get rid of branches that are merged or no longer on the remote
# (Basically so I don't have to look this command up all the time)

# Get rid of things already merged in:
git branch --merged master | grep -v 'master$' | xargs git branch -d

# Stop tracking remote things that are now gone:
git remote prune origin
