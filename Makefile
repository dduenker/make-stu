# This makefile is only used in case you are too lazy to run ./stu or install stu yourself
all: main.stu stu.sh 
	@./stu.sh

stu.sh:
	@wget https://raw.githubusercontent.com/dduenker/make-stu/master/sh/stu.sh
	@chmod a+x stu.sh

main.stu:
	@printf "\033[0;31m main.stu missing, drop this Makefile in a directory, which contains one\033[0m\n"
	@exit 1
