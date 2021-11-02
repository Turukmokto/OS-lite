#! /bin/bash

echo $$ > .pid

signal_term()
{
    echo "Got a signal 'TERM'"
    exit 0
}
signal_kill()
{
    echo "Got a signal 'KILL'"
    exit 0
}

signal_quit()
{
    echo "Got a signal 'QUIT'"
    exit 0
}

trap 'signal_term' SIGTSTP
trap 'signal_quit' USR1
trap 'signal_kill' USR2

echo "Wait signals from Generator. Enter something to quit."
read something
exit 0