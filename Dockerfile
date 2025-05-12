FROM nginx:alpine

# The appconfig can be overriden when runing a container using a bind mount: -v C:\Config\appconfig.json:/usr/share/nginx/html/assets/config/appconfig.json
COPY ./dist/angular-test /usr/share/nginx/html

# The nginx config can be overriden when runing a container using a bind mount: -v C:\Config\nginx2.conf:/etc/nginx/nginx.conf 
COPY ./config/nginx.conf /etc/nginx/nginx.conf

COPY ./Version.json /etc/Version.json
COPY ./appversion.json /usr/share/nginx/html/assets/version/appversion.json

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# docker run example:
# docker run -d -p 35101:80 angulartest:latest