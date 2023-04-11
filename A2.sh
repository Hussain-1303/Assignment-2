#!/bin/bash
echo "The script PID is $$"
sleep 30 &
child_PID=$!
echo "Child PID is $child_PID"
echo "Child process with PID $child_PID is now in the OS waiting queue."
echo "The child process is waiting for a software interrupt from the user."
echo "Enter the SIGINT interrupt to have the child process execute on the CPU."
trap 'echo "  SIGINT signal received"' SIGINT
read sigin
trap $sigin SIGINT
kill -SIGSTOP $child_PID
echo "Enter SIGQUIT interrupt."
trap 'echo "  SIGQUIT signal received"' SIGQUIT
read sigout
trap $sigout SIGQUIT
kill -STOP $child_PID
echo "Completed executing."
echo "Terminated all processes."
exit 0