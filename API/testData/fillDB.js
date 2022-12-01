require('dotenv').config({path: 'DOC-20221128-WA0000.env'});

const request = require('request')
const data = require("./testData.json")

const api = process.env.API_URL;

request.delete({
    url: `${api}/deleteAll` ,
  }, function(error, response, body){
    if (error) console.log(error)
    console.log(body)

    for(entry of data){
        request.post({
            url: `${api}/post` ,
            body: entry,
            json: true
          }, function(error, response, body){
            if (error) console.log(error)
        console.log(body)
        }); 
    }
});


