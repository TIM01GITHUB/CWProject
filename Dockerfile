FROM nginx:1.25.2
EXPOSE 3000
COPY . /usr/share/nginx/html
