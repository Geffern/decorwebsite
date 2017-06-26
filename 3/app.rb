# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
require 'sendgrid-ruby'
include SendGrid
# get from adress from our form
from = Email.new(email: params[:email])
to = Email.new(email: 'jandn@gmail.com')
subject = params[:title]
content = Content.new(type: 'text/plain', value: params[:body])
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
redirect '/contact'