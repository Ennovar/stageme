FROM ennovarplayerone/rordev

COPY . /gitlabcd
WORKDIR /gitlabcd
ENV RAILS_ENV=production
RUN bundle install
ENV SECRET_KEY_BASE=ajsdlkjfiwuionjcljk
CMD ["rails", "s", "-p", "8000", "-b", "0.0.0.0"]


