#inherit git
FROM alpine/git

#inherit homebrew
FROM homebrew/brew

#setup
RUN apt-get update -y -q
RUN apt-get install -y -q unzip xvfb curl wget zlib1g-dev ruby bundler git libxi6 libgconf-2-4

#install rbenv
RUN export PATH="/home/linuxbrew/.linuxbrew/opt/openssl@1.1/bin:$PATH" >> ~/.bash_profile
RUN export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)" >> ~/.bash_profile
RUN brew install rbenv; exit 0

#Install Ruby
RUN apt-get -y install libssl-dev && rbenv install 2.6.6
RUN eval "$(rbenv init -)" && rbenv shell 2.6.6 && ruby -v

#Install Chrome
RUN apt-get -y install libatk1.0-0 fonts-liberation libappindicator3-1 libasound2 libnspr4 libnss3 libxss1 xdg-utils libgbm1
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN ls -a

#chromedriver download
RUN wget -q --continue -P /usr/bin "http://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_linux64.zip"

#unzip chrome driver
RUN apt install unzip
WORKDIR /usr/bin
RUN ls -a
RUN unzip -d /usr/bin /usr/bin/chromedriver* chromedriver
RUN ls -a

#clone git repo

WORKDIR /
RUN alias git="docker run -ti --rm -v $(pwd):/git -v $HOME/.ssh:/root/.ssh alpine/git"

#set local directory bundle install
WORKDIR /

CMD git clone https://jerren1122:bd2dc7145c61e68bbd438af06219d09f852ae9eb@github.com/jerren1122/web_repo.git; cd web_repo; ls; eval "$(rbenv init -)"; rbenv shell 2.6.6; ruby - v; gem install bundler; bundle install; eval "$(rbenv init -)"; rbenv shell 2.6.6; ruby './lib/utilities/dynamic_tags.rb' $total_number_of_builds $build_number; export browser_executable_location=/usr/bin/google-chrome-stable ; export driver_executable_location=/usr/bin/chromedriver; export or_tags=split_builds ;rake features:default

