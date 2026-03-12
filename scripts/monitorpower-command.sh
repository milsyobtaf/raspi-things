#!/bin/bash
startTime="0900" # The time the day should start
endTime="2000" # The time the day should end
currentTime=`date +"%H%M"` # The current time, for comparison
output="" # Output message for the console

dayTimeCommand="sudo /etc/init.d/deeper start" # The command we want to run to start the day
nightTimeCommand="sudo /etc/init.d/deeper stop" # The command we want to run to end the day

if [[ 10#$currentTime -ge 10#$startTime && 10#$currentTime -le 10#$endTime ]];
  then
  output="It's daytime! Let's turn on the lights."
  $dayTimeCommand
else
  $nightTimeCommand
  output="It's nighttime! Let's turn off the lights."
fi

# logging output
echo "=^.^= =^.^= =^.^= =^.^="
echo $startTime
echo $endTime
echo $currentTime
echo $output
