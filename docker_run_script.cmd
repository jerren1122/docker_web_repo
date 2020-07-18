set starting_time=%time%
set starting_date=%date%

docker-compose rm -f
docker-compose up

docker container cp sample_cucumber_one_1:web_repo/output ./docker_output/1
docker container cp sample_cucumber_two_1:web_repo/output ./docker_output/2
docker container cp sample_cucumber_three_1:web_repo/output ./docker_output/3
docker container cp sample_cucumber_four_1:web_repo/output ./docker_output/4
docker container cp sample_cucumber_five_1:web_repo/output ./docker_output/5
docker container cp sample_cucumber_six_1:web_repo/output ./docker_output/6
docker container cp sample_cucumber_seven_1:web_repo/output ./docker_output/7
docker container cp sample_cucumber_eight_1:web_repo/output ./docker_output/8

ruby './lib/utilities/valid_output.rb' %starting_date% %starting_time%