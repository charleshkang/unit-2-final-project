var TWILIO_ACCOUNT_SID = "AC66c9ea5429517d983d0f9eec0b7adcc4";
var TWILIO_AUTH_TOKEN = "c77ff9cd7f6efaa52272f6f807f4c171";
var twilio = require('twilio')(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN);

Parse.Cloud.define("send_twilio_message", function(request, response) {

  var Entry = Parse.Object.extend("Entry");

  var query = new Parse.Query(Entry);
  query.find({
    success: function(results) {

      twilio.sms.messages.create({
          to: "+19177534949",
          from: "+12016907828",
          body: "Hey, Lauren, here's the apartment you were looking at! " + results[0].get('apartmentLocation') + ' '  + "The price range for this apartment is:" + ' ' + results[0].get('apartmentPrice')
        },
        function(error, msg) {
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
curl -X POST \
 -H "X-Parse-Application-Id: d4QBKnNptgpeFwOvuSOqPu6DKpd7mo9bmk2WvtYV" \
 -H "X-Parse-REST-API-Key: lwrNbCTiQgttqSz92HQB0T4qEraydWm9fO8GZBlC" \
 -H "Content-Type: application/json" \
 -d '{}' \
 https://api.parse.com/1/functions/send_twilio_message
 */
