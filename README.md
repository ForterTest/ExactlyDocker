# Docker environment for Exactly test project

Prerequisites
**docker**, **npm** and **composer** installed


To run the environment, use these commands in command line:
```
git clone https://github.com/ForterTest/ExactlyDocker.git
cd ExactlyDocker
sudo ./run.sh
```

After the script has finished the job, wait for a few seconds for containers to start, and feel free to connect to:
* http://127.0.0.1 - User page, where clients and tokens may be created.
* http://127.0.0.1:88 - Sample service, which uses all the necessary API endpoints. Example user credentials: **lourdes44@example.org | password**


To stop the environment, use this command in command line:
```
sudo ./stop.sh
```
