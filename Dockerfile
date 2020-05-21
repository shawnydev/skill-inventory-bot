FROM rails:onbuild

WORKDIR /myapp

COPY Gemfile /myapp
COPY Gemfile.lock /myapp
