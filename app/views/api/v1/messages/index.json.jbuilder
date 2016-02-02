json.messages do 
	json.array! @messages do |message|
	  json.partial! "message", message: message
	 end
end