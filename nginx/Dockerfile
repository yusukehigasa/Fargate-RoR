FROM nginx:1.15.8

# Remove including dir
RUN rm -f /etc/nginx/conf.d/*

# For copy Nginx configs from host to guest
ADD nginx.conf /etc/nginx/conf.d/webapp.conf

# Run Nginx after build
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

#Added 20.03.27
# # Mount static files
# ADD public /webapp/public
