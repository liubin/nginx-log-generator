FROM ruby:2.2
RUN gem install apache-loggen
COPY app.rb /app.rb
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
