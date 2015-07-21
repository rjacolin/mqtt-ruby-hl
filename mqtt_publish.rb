require 'mqtt'
require 'json'

# Prepare MQTT credentials for device
system_id = '65A530A9'
app_password = '12345'

# Build JSON payload for MQTT message
payload = '[{"greenhouse.temperature":[{"value":20}]},{"greenhouse.humidity":[{"value":65}]}]'

puts payload
puts "MQTT payload: #{payload}"

# Connect MQTT client and publish JSON payload
MQTT::Client.connect(
    :remote_host => 'eu.airvantage.net',
    :remote_port => 1883,
    :username => system_id,
    :password => app_password
) do |c|
  bytes = c.publish(system_id + '/messages/json', payload)
  puts "Published #{bytes.to_s} bytes."
end