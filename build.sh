##DEBUG Line by line
docker run -it --rm r-base:4.2.0 bash 


##REMOVE EXOME DEPTH AND INSTALL MANUALLY?
docker buildx build . --tag=decon:v0.0.1 --platform=linux/amd64
docker tag decon:v0.0.1 dnousome/decon:v0.0.1
docker push dnousome/decon:v0.0.1

#docker run --platform=linux/amd64 -ti decon:v0.0.1 /bin/bash 
