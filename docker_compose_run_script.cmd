set starting_time=%time%
set starting_date=%date%

docker-compose rm -f
docker-compose up

docker container cp sample_cucumber_one_1:docker_web_repo/output ./docker_output/1
docker container cp sample_cucumber_two_1:docker_web_repo/output ./docker_output/2
docker container cp sample_cucumber_three_1:docker_web_repo/output ./docker_output/3
docker container cp sample_cucumber_four_1:docker_web_repo/output ./docker_output/4
docker container cp sample_cucumber_five_1:docker_web_repo/output ./docker_output/5
docker container cp sample_cucumber_six_1:docker_web_repo/output ./docker_output/6
docker container cp sample_cucumber_seven_1:docker_web_repo/output ./docker_output/7
docker container cp sample_cucumber_eight_1:docker_web_repo/output ./docker_output/8
docker container cp sample_cucumber_nine_1:docker_web_repo/output ./docker_output/9
docker container cp sample_cucumber_ten_1:docker_web_repo/output ./docker_output/10
docker container cp sample_cucumber_eleven_1:docker_web_repo/output ./docker_output/11
docker container cp sample_cucumber_twelve_1:docker_web_repo/output ./docker_output/12

docker container logs sample_cucumber_one_1 > ./docker_output/1/logs.txt
docker container logs sample_cucumber_two_1 > ./docker_output/2/logs.txt
docker container logs sample_cucumber_three_1 > ./docker_output/3/logs.txt
docker container logs sample_cucumber_four_1 > ./docker_output/4/logs.txt
docker container logs sample_cucumber_five_1 > ./docker_output/5/logs.txt
docker container logs sample_cucumber_six_1 > ./docker_output/6/logs.txt
docker container logs sample_cucumber_seven_1 > ./docker_output/7/logs.txt
docker container logs sample_cucumber_eight_1 > ./docker_output/8/logs.txt
docker container logs sample_cucumber_nine_1 > ./docker_output/9/logs.txt
docker container logs sample_cucumber_ten_1 > ./docker_output/10/logs.txt
docker container logs sample_cucumber_eleven_1 > ./docker_output/11/logs.txt
docker container logs sample_cucumber_twelve_1 > ./docker_output/12/logs.txt

cd ./lib/utilities

ruby 'valid_output.rb' "%starting_date%" "%starting_time%"