A few examples of using flock to get critical sections in a shell script

* cs0.sh - A contrived example that uses two subprocesses to write to a log with no coordination
* cs.sh - The same example that has the two processes lock the log file using a very simple method
* cs1.sh - The same example using the file descriptor method
* single.sh - A script you can only have one instance of

These are examples in a Hackaday Linux-Fu post https://wp.me/paBn4l-1MaX

