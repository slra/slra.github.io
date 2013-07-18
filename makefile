# makefile: SLRA makefile
all: 
	./jemdoc.py index.jemdoc
	./jemdoc.py software.jemdoc
	./jemdoc.py drwa13.jemdoc
	./jemdoc.py drwa13test.jemdoc
	./jemdoc.py drwa13/bamdev.jemdoc
	./jemdoc.py drwa13/francesco.jemdoc
	./jemdoc.py drwa13/ivan.jemdoc
	./jemdoc.py drwa13/kol.jemdoc
	./jemdoc.py drwa13/kostia.jemdoc
	./jemdoc.py drwa13/lieven.jemdoc
	./jemdoc.py drwa13/marco.jemdoc
	./jemdoc.py drwa13/maria.jemdoc
	./jemdoc.py drwa13/nicolas.jemdoc
	
pull:
	git pull origin master	
	
	
push:
	git push origin master	
	


