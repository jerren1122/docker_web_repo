Overview: This repo houses all of the sample code for running a Ruby/Cucumber suite in parallel with Docker. 

Important Concepts: 
1. How to run docker container with env variables: docker container run -e total_number_of_builds=3 -e build_number=2 cc_runner:v2
2. cucumber-example is the image name I am building to utilize with the cmd script. 

Steps to implement in another Ruby/Cucumber suite. 
1. Alter gemfile to include collateral cucumber
2. add/mod Dockerfile to repo. 
    - Would need to change the repo you are copying in to the Docker container. 
    - Need to look if you are calling the cc_runner script from the right place. 
3. add/mod Docker Compose to repo
    - Would need to set the number of containers you want. 
    - Would need to set the docker image you are creating the containers from. 
4.  add/Mod docker_compose_run_script.cmd Script
    - locations will have to be changed based on Docker naming conventions for where files will be. 
5. add cc_runner 
    - ensure that the file paths are correct for your unique suite. 
    - ensure that the split tag is what you want it to be. 
6. add Docker Output location. 
    - Ensure that this directory is located where expected for the .cmd script
    

        

