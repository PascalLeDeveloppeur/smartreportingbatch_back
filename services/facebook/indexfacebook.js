const request = require('request');



exports.facebookBatch = (pageId, networkToken, callback)=>{

    request(`https://graph.facebook.com/v5.0/${pageId}/posts?access_token=${networkToken}`, { json: true }, (err, res) => {
      if (err) { return console.log(err); }      

      callback(res.body.data);
    });
}

exports.facebookBatchInAutomation = (facebookRequest, callbackRequestToApi)=>{
    console.log("***************************");
    console.log('Service FB:', facebookRequest);
    request(facebookRequest, { json: true }, (err, res) => {
      if (err) { return console.log(err); }      

      callbackRequestToApi(res.body.data);
    });
}

exports.facebookRequest = `https://graph.facebook.com/v5.0/:pageid/posts?access_token=:pagetoken`;


