#!/bin/sh
if `nc -vz -u localhost 53 2>&1 | grep -q open`
then
  echo "OK"
  exit 0
else
  echo "ERROR"
  exit 1
fi