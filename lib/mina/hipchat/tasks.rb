require 'mina/hooks'
require 'json'
require 'net/http'
require 'uri'


namespace :hipchat do

	task :starting do
		if hipchat_token and hipchat_room
			starting_msg = "#{deployer} is deploying now #{announced_application_name}"

			# Post starting message
			post_hipchat_message(starting_msg)

			# Start time tracking
			set(:start_time, Time.now)
		else
			print_local_status "Unable to send notification, no HipChat details provided."
		end
	end

	task :finished do
		if hipchat_token and hipchat_room

			# End time tracking and calculate elapsed time
			end_time = Time.now
			start_time = fetch(:start_time)
			elapsed = end_time.to_i - start_time.to_i

		      end_msg = "#{deployer} successfully deployed #{announced_application_name} in #{elapsed} seconds."
		      post_hipchat_message(end_msg);
	      else
			print_local_status "Unable to send notification, no HipChat details provided."
		end

	end

	def short_revision
		deployed_revision[0..7] if deployed_revision
	end

	def announced_application_name
		"".tap do |output|
			output << hipchat_application if hipchat_application
			output << " #{branch}" if branch
			output << " (#{short_revision})" if short_revision
		end
	end

	def post_hipchat_message(message)
		# Parse the URI and handle the https connection
		uri = URI.parse("https://api.hipchat.com/v2/room/#{room_id}/notification?auth_token=#{hipchat_token}")
		http = Net::HTTP.new(uri.host, uri.port)

		payload = {
			"id_or_roomname" 	=> hipchat_room,
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
