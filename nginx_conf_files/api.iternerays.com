# nginx configuration for port 80
server {
	listen 80;
	server_name api.iternerays.com;

location /static {
	root /home/ubuntu/django_example_repo;
}

location / {
	proxy_pass "http://127.0.0.1:8000";
    }
}
