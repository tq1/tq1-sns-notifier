AWS = require 'aws-sdk'
config = require './config'

class SNSNotifier

  @configure: (aws) ->
    config.configure aws

  connect = (callback) ->

    AWS.config.accessKeyId = config.aws.key
    AWS.config.secretAccessKey = config.aws.secret
    AWS.config.region = config.aws.region

    callback new AWS.SNS()

  publish = (service, params, callback) ->
    service.publish params, (err, data) ->
      callback(err) if callback?

  @sendEmailNotification = (subject, message, callback) ->

    callback('SNS Notifier not configured') if not config.isConfigured
    
    params =
      Subject: subject
      Message: message
      TopicArn: config.aws.topic

    connect (service) ->
      publish service, params, callback

module.exports = EmailNotifier