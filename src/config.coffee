class Config

  @isConfigured = false

  @aws =
    key: {}
    secret: {}
    region: {}
    topic: {}

  @configure: (aws) ->
    
    if aws?.key? then @aws.key = aws.key else throw ('Missing aws.key')
    if aws?.secret? then @aws.secret = aws.secret else throw ('Missing aws.secret')
    if aws?.region? then @aws.region = aws.region else throw ('Missing aws.region')
    if aws?.topic? then @aws.topic = aws.topic else throw ('Missing aws.topic')

    @isConfigured = true


module.exports = Config
