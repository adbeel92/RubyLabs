json.user do
  json.partial! "user", user: @user
end
json.messages do
  json.array! @messages do |message|
	  json.partial! "api/v1/messages/message", message: message
  end
end