app="selden-php-test"
docker stop ${app}
docker rm ${app}
docker build -t ${app} .
# docker run -d -p 8090:80 --name=${app} -v $PWD:/app ${app}
# docker run -it --name=${app} ${app}
docker run -d -p 80:80 --name=${app} ${app}
