# Server functions available

The app is deployed in https://vast-earth-2490.herokuapp.com/

## Check new email
Description: Returns an array with 0 or more emails.
Method: GET /email/new

## Get email
Description: Return all the email information, including the body
Method: GET /email/emailId
Example: /email/1234

## Send an email
Description: Simulates the process of sending email
Method: POST /email
