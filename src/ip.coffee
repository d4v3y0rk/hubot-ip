# Description
#   Network information from your favorite chat bot
#
# Configuration:
#   NONE
#
# Commands:
#   hubot what is your ip?
#   hubot what is your public ip?
#
# Notes:
#   basic ip info from hubot
#
# Author:
#   Dave York[dave.york@me.com]

require 'shelljs/global'

module.exports = (robot) ->
  robot.respond /what is your public ip/i, (msg) ->
    publicIp =  JSON.parse(exec('curl -s https://api.ipify.org?format=json', {silent:true}).output).ip
    msg.send "#{publicIp}"

  robot.respond /what is your ip/i, (msg) ->
    ip = exec("ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\\.){3}[0-9]*).*/\\2/p'", {silent:true}).output
    msg.send "#{ip}"
