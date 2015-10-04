GetMAC()
{
  if [ -n "$1" ]; then
    OID="00:16:3e"
    RAND=$(echo $1 | md5sum | sed 's/\(..\)\(..\)\(..\).*/\1:\2:\3/')
    echo "$OID:$RAND"
  else
    echo "Please supply host name from which to create MAC address:"
    echo "$FUNCNAME HOSTNAME"
  fi
}
