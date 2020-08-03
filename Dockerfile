FROM ubuntu:xenial as setup-stage

#install wget
RUN apt-get update -y -q
RUN apt-get install -y -q wget

#Install Chrome
RUN apt-get -y install libatk1.0-0 fonts-liberation libappindicator3-1 libasound2 libnspr4 libnss3 libxss1 xdg-utils libgbm1
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb

#chromedriver download
RUN wget -q --continue -P /usr/bin "http://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_linux64.zip"

#unzip chrome driver
RUN apt install unzip
WORKDIR /usr/bin
RUN unzip -d /usr/bin /usr/bin/chromedriver* chromedriver

FROM alpine/git as git-stage
WORKDIR /
RUN git clone https://jerren1122:bd2dc7145c61e68bbd438af06219d09f852ae9eb@github.com/jerren1122/web_repo.git

#inherit ruby
FROM ruby:2.7.1
COPY --from=setup-stage /usr/bin/google-chrome-stable /usr/bin/google-chrome-stable
COPY --from=setup-stage /usr/bin/google-chrome /usr/bin/google-chrome
COPY --from=setup-stage /usr/bin/chromedriver /usr/bin/chromedriver
COPY --from=git-stage /web_repo /web_repo


WORKDIR /
RUN alias git="docker run -ti --rm -v $(pwd):/git -v $HOME/.ssh:/root/.ssh alpine/git"
CMD cd /web_repo; gem install bundler; bundle install;ruby './lib/utilities/dynamic_tags.rb' $total_number_of_builds $build_number; export browser_executable_location=/usr/bin/google-chrome-stable ; export driver_executable_location=/usr/bin/chromedriver; export or_tags=split_builds ;rake features:default
