# makefile: SLRA makefile
all: 
	./jemdoc.py index.jemdoc
	./jemdoc.py publications.jemdoc
	./jemdoc.py software.jemdoc
	./jemdoc.py examples.jemdoc
	./jemdoc.py presentations.jemdoc
	./jemdoc.py drwa13.jemdoc
	./jemdoc.py lectures.jemdoc
	./jemdoc.py sessions.jemdoc
pull:
	git pull origin master	
push:
	git push origin master	

