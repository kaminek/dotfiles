echo $(sensors | grep fan | cut -d ":" -f2 | awk '{print $1}')
