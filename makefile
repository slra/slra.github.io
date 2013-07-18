# makefile: SLRA makefile
all: 
	./jemdoc.py index.jemdoc
	./jemdoc.py software.jemdoc
	./jemdoc.py drwa13.jemdoc
pull:
	git pull origin master	
push:
	git push origin master	

