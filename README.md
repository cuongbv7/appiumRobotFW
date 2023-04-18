# Parallel Appium Test in Robot Framework via Pabot
- [http://robotframework.org/](http://robotframework.org/)
- [https://pabot.org/](https://pabot.org/)
- [https://appium.io/](https://appium.io/)

### Pre-Requisites
* Python
* Android sdk
* Robot Framework
* Appium 
* Selenium server standalone

### Installation
- Python

Follow the tutorial on how to install Python [here](https://realpython.com/installing-python/)

- Appium
```
$ npm install -g appium
```
- Robotframework, Appium Library, and Pabot
```
$ pip3 install -r requirements.txt
```
### Run Appium grid
```
$ cd appiumGrid
$ chmod 777 startGridScript.sh
$ ./startGridScript.sh

```


### Devices Set
Store device info such as UDID, Name,, and System Port as .dat file

E.g.

```
[Device1]
tags=device1
udid=9RGNU20920100424
system_port=8201

[Device2]
tags=device2
udid=4aba4aacac3f71ce
system_port=8202
```
### How To Run
```
if you want to separate test scripts and run parallel on multiple devices
$ ./run-test.sh [appium_server] [tag] [threads]
./run-test.sh http://0.0.0.0:4444/wd/hub login 2
```
```
if you want to run all test on on multiple devices

 pabot --pabotlib  --argumentfile1 first.args --argumentfile2 second.args -v runOn:local -v appium_server:{appium_server} -i {tags} [path to tests]
 pabot --pabotlib  --argumentfile1 first.txt --argumentfile2 second.txt -v runOn:local  -v appium_server:http://0.0.0.0:4444/wd/hub -i search --exclude ignore src/scenario
```
```
if you want to run all test on on browserStack

 pabot --pabotlib  --argumentfile1 first.args --argumentfile2 second.args -v runOn:browserStack -v appium_server:{appium_server} -i {tags} [path to tests]
 pabot --pabotlib  --argumentfile1 first_BS.txt --argumentfile2 second_BS.txt -v runOn:browserStack -v app_id:bs://9eaf75ab7fb2b970e8d7f9cbe791ecee064bd022   -v appium_server:https://vitcngbi_9My82d:ypfk8SS6zCTmwfBgzJKs@hub-cloud.browserstack.com/wd/hub -i search --exclude ignore src/scenario
```
