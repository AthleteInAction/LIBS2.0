require './gentools'
require 'net/http'

a = Time.now.to_f

http = Net::HTTP.new('localhost',3000)
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
# http.use_ssl = true

uri = '/api/v1/login.json'
uri = URI.escape uri

req = Net::HTTP::Post.new(uri)

content_type = 'application/json'
req.content_type = content_type

req.basic_auth 'tests','12345'

payload = {}.to_json
req.body = payload

response = http.request req

code = response.code.to_f.round
body = response.body

b = Time.now.to_f
c = ((b-a)*100).round.to_f/100

JP JSON.parse(response.body)