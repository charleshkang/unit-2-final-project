var TWILIO_ACCOUNT_SID = "AC66c9ea5429517d983d0f9eec0b7adcc4";
var TWILIO_AUTH_TOKEN = "c77ff9cd7f6efaa52272f6f807f4c171";
var twilio = require('twilio')(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN);

Parse.Cloud.define("send_twilio_message", function(request, response) {

  var User = Parse.Object.extend("User");
  var query = new Parse.Query(User);
  query.find({
    success: function(results) {
      twilio.sms.messages.create({
          to: "+19494916672",
          from: "+12016907828",
          body: "testing!" + results[0].get('userId')
        }, function(error, msg) {
          if (error) {
            response.error(error);
          } else {
            response.success();
          }
        });
      }
  });
});

/*
 success: function(httpResponse) {
  console.log(httpResponse.text);
  response.success(httpResponse.text);
},
error: function(httpResponse) {
console.error('Request failed with response code ' + httpResponse.status);
response.error('Request failed with response code ' + httpResponse.status)
});
*/

/*
curl -X POST \
 -H "X-Parse-Application-Id: d4QBKnNptgpeFwOvuSOqPu6DKpd7mo9bmk2WvtYV" \
 -H "X-Parse-REST-API-Key: lwrNbCTiQgttqSz92HQB0T4qEraydWm9fO8GZBlC" \
 -H "Content-Type: application/json" \
 -d '{}' \
 https://api.parse.com/1/functions/send_twilio_message
 */


/*
$ curl https://taskrouter.twilio.com/v1/Workspaces/{WorkspaceSid}/TaskQueues/{QU11552c4a270543a195ed2461e1320cd9} \
    -u '{AC66c9ea5429517d983d0f9eec0b7adcc4}:{c77ff9cd7f6efaa52272f6f807f4c171}'
    */
