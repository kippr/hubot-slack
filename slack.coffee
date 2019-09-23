SlackBot = require './src/bot'
require './src/extensions'

exports.use = (robot) ->
  options =
    token:           process.env.HUBOT_SLACK_TOKEN
    disableUserSync: process.env.DISABLE_USER_SYNC?
    autoReconnect:   !process.env.HUBOT_DISABLE_AUTO_RECONNECT?
  try
    options.rtm = JSON.parse(process.env.HUBOT_SLACK_RTM_CLIENT_OPTS)
  catch
  try
    options.rtmStart = JSON.parse(process.env.HUBOT_SLACK_RTM_START_OPTS)
  catch
  new SlackBot robot, options
