#! /bin/bash

osascript -e 'tell app "Terminal"
    do script "cd '${PWD}' && java -jar selenium-server-standalone-3.141.59.jar -port 4444 -host 0.0.0.0 -role hub -hubConfig grid.json"
end tell'
osascript -e 'tell app "Terminal"
    do script "cd '${PWD}' && appium --nodeconfig android-1.json -p 4723 -bp 5523"
end tell'
osascript -e 'tell app "Terminal"
    do script "cd '${PWD}' && appium --nodeconfig ios.json -p 4726 -bp 5526"
end tell'

