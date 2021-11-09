git submodule update --init --recursive
echo "===================Installing the Web-client"
cd playground-client && sudo npm i && cp VuetableCssConfig.js node_modules/vuetable-2/src/components
echo "===================Installing the server"
cd ../readmongo/swarmlab-app/src && sudo npm i
echo "===================Installing the dummyservice"
cd ../../../dummyservice/swarmlab-app/src && sudo npm i

# cd ../../ && ./runw.sh && docker-compose up
