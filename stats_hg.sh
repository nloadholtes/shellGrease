#
# Top 10 commands used with hg.
# via https://coderwall.com/p/-o1nda
history|grep hg| awk '{CMD[$3]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
