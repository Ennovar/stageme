netstat -tulpn | awk '{n=split($4,a,":"); print a[n]}' | grep -Eo '[0-9]*' | sort -nu | python -c 'import sys;import json; print json.dumps(sys.stdin.readlines()).replace("\\n","")'
