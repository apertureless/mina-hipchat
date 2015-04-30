require 'mina/hooks'
require 'json'
require 'net/http'
require 'uri'


namespace :hipchat do

	def post_hipchat_message(message)
		# Parse the URI and handle the https connection
		uri = URI.parse("https://api.hipchat.com/v2/room/#{room_id}/notification?auth_token=#{hipchat_token})
		http = Net::HTTP.new(uri.host, uri.port)

		payload = {
			"parse"       			=> "full",
			"id_or_roomname" 	=> slack_room,
			"color"   	 			=> color,
			"message"  			=> message,
			"notify"  				=> notify,
			"message_format"		=> msg_format
		}

		# Create the post request and setup the form data
		request = Net::HTTP::Post.new(uri.request_uri)
		request.set_form_data(:payload => payload.to_json)

		# Make the actual request to the API
		http.request(request)
	end

end
