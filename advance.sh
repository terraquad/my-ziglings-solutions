#!/bin/bash
# ziglings exercise script becuz im lazy

# Generate count file if it doesn't exist yet
if [ ! -f advance_cnt.txt ] || [[ $(cat advance_cnt.txt | xargs) == "" ]]; then
  echo "1" > advance_cnt.txt
fi

ex_count=$(cat advance_cnt.txt | xargs) # Read file contents to skip passed exercise compliation.

while true; do
  cmd="zig build -Dn=$ex_count" # Ziglings compile command
  echo $ex_count > advance_cnt.txt # Set here in case user quits with ctrl+c
  clear
  echo "Running '$cmd'..."
  $cmd
  # Zig returned error status code, so user failed exercise
  if [ $? -ne 0 ]; then
    echo
    echo "Exercise $ex_count failed!"
    read -p "Press enter to retry or press Ctrl+C to quit. "
    continue
  fi
  # Loop was continued up there if user failed, so user passed if he is still here.
  echo
  echo "Exercise $ex_count passed!"
  read -p "Press enter to proceed or press Ctrl+C to quit. "
  ex_count=$(($ex_count + 1))
done
