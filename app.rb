require 'sinatra'
require 'sendgrid-ruby'
include SendGrid


before do 
	@class_name="default"
end


get '/' do
	@class_name="home"	
	erb :home
end

get '/inspiration' do
	@class_name="inspiration"	
	erb :inspiration
end

get '/about' do
	@class_name="about"	
	erb :about
end

get '/contact' do
	@class_name="contact"	
	erb :contact
end

post '/contact' do
  # get from address from our form
  # to do: verify the email is valid
  from = Email.new(email: params[:email])
  to = Email.new(email: 'nkp305@gmail.com')
  # get subject from our form
  subject = params[:title]
  # get content from our form
  content = Content.new(type: 'text/plain', value: params[:body])
  mail = Mail.new(from, subject, to, content)

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
  redirect '/contact'
end
