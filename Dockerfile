FROM ruby:3.0.2
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs yarn vim tmux handbrake handbrake-cli ffmpeg imagemagick postgresql-client
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN gem install bundler:2.2.27
RUN bundle install
ADD . /usr/src/app
EXPOSE 3000
CMD ["bin/rails","s","-b","0.0.0.0"]
