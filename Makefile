# This makefile can be dropped into your stu-dependent project, to provide
# a simple way to create a local stu build, in case the person using your
# project does not have stu installed.
#
# Visit https://github.com/dduenker/make-stu for the newest version of this file.
#
# If you want to know more about stu, visit https://github.com/kunegis/stu
#
all: main.stu stu.sh 
	@./stu.sh

stu.sh:
	@wget https://raw.githubusercontent.com/dduenker/make-stu/master/sh/stu.sh
	@chmod a+x stu.sh

main.stu:
	@printf "\033[0;31m main.stu missing, drop this Makefile in a directory, which contains one\033[0m\n"
	@exit 1
