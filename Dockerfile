FROM ennovarplayerone/rordev

COPY . /gitlabcd
WORKDIR /gitlabcd
RUN bundle install
RUN rake db:create
RUN rake db:migrate
CMD ["rails", "s", "-p", "9999:3000", "-b", "0.0.0.0"]
