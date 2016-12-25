# Creting docker instance for PostGreSQL

1. Get instance of needed docker image 
  
  sudo docker run --name <name_of_container> -e POSTGRES_PASSWORD=<password_for_db_root_inside_container> -p <local_p>:<docker_p> postgres:9.3
  sudo docker run --name pgcontainer -e POSTGRES_PASSWORD=<password_for_db_root_inside_container> -p 5450:5432 postgres:9.3

  Maps port 0:0:0:0:5432 -> 5432

2. Remove container

  sudo docker rm <name_of_container>
  sudo docker rm pgcontainer

3. Attach to container with bash running

  sudo docker exec -it <name_of_container> <name_of_application>
  sudo docker exec -it pgcontainer bash
