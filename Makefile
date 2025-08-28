FILE = ./srcs/docker-compose.yml

up :
	docker-compose -f $(FILE) up -d --build

clean : 
	docker-compose -f $(FILE) stop
fclean :
	docker-compose -f $(FILE) stop \
	&& sudo rm -rf /home/redarnet/data \
	&& mkdir /home/redarnet/data \
	&& docker system prune -a
.PHONY: up clean fclean

