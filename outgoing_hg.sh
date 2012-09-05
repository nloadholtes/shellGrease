#
# outgoing.sh
# Gives a listing of the files that have been changed and are outgoing (for mercurial)
#
# Nick Loadholtes <nick@ironboundsoftware.com>
hg out | grep files | awk '{for(x=1;x<NF+1;x++){print $x;}}' | sort | uniq
