# tq1-sns-notifier
TQ1 notifier using SNS topics

## Usage
1. Add the following to `package.json`
```
  "dependencies": {
    "tq1-sns-notifier": "git@github.com:tq1/tq1-sns-notifier.git#0.0.1"
   }
```
3. Create a topic on [Amazon SNS](https://console.aws.amazon.com/sns/)
4. Create an user on [Amazon AWS](https://console.aws.amazon.com/iam/) and grant credentials to publish (`sns:Publish`) to topic created before
```coffeescript
notifier = require('tq1-sns-notifier')

awsConfig =
  key:    config.email_notifier.access_key  # user's access key
  secret: config.email_notifier.secret_key  # user's access secret
  region: config.email_notifier.region      # topic's region
  topic:  config.email_notifier.topic       # topic's arn
  
notifier.configure(awsConfig)

subject = 'Email Subject'
message = 'The message that goes in email\'s body.\n\n Best regards,\n TQ1 Email Notifier.'

notifier.sendEmailNotification subject, message, (err) ->
    console.log err if err
```
