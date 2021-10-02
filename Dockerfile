
FROM jerren1122/cucumber_env
WORKDIR /
CMD git clone https://github.com/jerren1122/docker_web_repo.git; cd docker_web_repo; ls; gem install bundler; bundle install; ruby cc_runner.rb; export or_tags=split_builds ;rake features:default

