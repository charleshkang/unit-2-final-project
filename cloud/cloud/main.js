var TWILIO_ACCOUNT_SID = "AC66c9ea5429517d983d0f9eec0b7adcc4";
var TWILIO_AUTH_TOKEN = "c77ff9cd7f6efaa52272f6f807f4c171";
var twilio = require('twilio')(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN);

Parse.Cloud.define("send_twilio_message", function(request, response) {

  var User = Parse.Object.extend("LinkedInUser");
  var query = new Parse.Query(User);
  query.find({
    success: function(results) {
      twilio.sms.messages.create({
          to: "+19177534949",
          from: "+12016907828",
          body: "what's up lauren" + results[0].get('userId')
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
