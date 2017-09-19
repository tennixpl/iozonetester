# iozonetester
A docker build of iozone applciation http://www.iozone.org/

Docker entrypoint and Configuration is meant ot run on a system with multplie volume mounts to test the speed of such systems from a running docker contaiener


example run

docker run -v /dfs/:/local -v /output/:target/ -e VOLUMES=/local iozonetster

this will write a file test.txt to /output for the iozone application in auto mode writing a file test to /dfs


