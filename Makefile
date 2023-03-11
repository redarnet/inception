FILE = ./srcs/docker-compose.yml

up :
	docker-compose -f $(FILE) up  --build

clean : 
	docker-compose -f $(FILE) stop

