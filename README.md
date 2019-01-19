# VM
 - runs its guest OS through hypervisor
 - has its own resources
 - better isolation
 - larger size

# Docker
 - share kernel of host machine
 - like a process in OS
 - share resources between other containers and processes
 - less isolation
 - smaller size

# Docker engine, container, image
 - your machine is a docker host
 - docker engine runs on docker host
 - create an image by building a Dockerfile or pulling from docker hub
 - run a new container based on an image
 - size of a running container grows as it runs

# Docker image
 - composed by many layers
 - each layer represents some changes to the previous docker image

# Dockerfile
 - a script to build docker image
 - each line in a Dockerfile adds a new layer for the building image
 - create one line Dockerfile to minimize layers created during docker build
 - note that multiple lines create multiple layers
   - but it speeds up building process by caching multiple layers

# Docker usage tips
 - use alpine if you want a small image
 - mount important data in host or use a data volume
 - commit a new image to save changes of a running container
 - run containers like web server in daemon mode

# Basic Docker command
 - sudo docker ps -a
 - sudo docker images
 - sudo docker run --name NAME -d IMAGE
 - sudo docker start NAME/ID
 - sudo docker stop NAME/ID
 - sudo docker rm NAME/ID
 - sudo docker rmi IMAGEID
 - sudo docker exec -it NAME/ID bash
 - sudo docker inspect NAME/ID
 - sudo docker network ls
 - sudo docker logs -f NAME/ID

# Some thoughts
 - evoluation
   - bare metal
   - vm
     - create template image to be used like a docker image
     - lower debug costs
   - container
     - good bye docker swarm
     - k8s seems promising
     - compose services with many small containers
       - easy to replace and upgrade
       - higher debug costs
   - serverless
     - no server maintenance
     - maintenance costs convert to managing functions
     - debug costs?
     - the only successful serverless service I have seen is
       - https://haveibeenpwned.com/
 - no free lunch
