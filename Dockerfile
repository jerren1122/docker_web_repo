
FROM jerren1122/cucumber_env

CMD git clone https://github.com/jerren1122/docker_web_repo.git; cd docker_web_repo; ls; eval "$(rbenv init -)"; rbenv shell 2.6.6; ruby - v; gem install bundler; bundle install; eval "$(rbenv init -)"; rbenv shell 2.6.6; ruby './lib/utilities/dynamic_tags.rb' $total_number_of_builds $build_number; export browser_executable_location=/usr/bin/google-chrome-stable ; export driver_executable_location=/usr/bin/chromedriver; export or_tags=split_builds ;rake features:default

