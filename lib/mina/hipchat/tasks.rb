require 'hipchat'

namespace :hipchat do

	desc "Starting deploy notification"
	task :starting_deploy do
		if hipchat_token and hipchat_room
			h_msg = "#{deployer} is deploying now: #{announced_application_name} "

			# Post starting message
			post_hipchat_message(h_msg)

			# Start time tracking
			set(:start_time, Time.now)
		else
			print_local_status "Unable to send notification, no HipChat details provided."
		end
	end

	task :finished_deploy do
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

	def post_hipchat_message(msg)
		# Parse the URI and handle the https connection
		client = HipChat::Client.new(hipchat_token, :api_version => 'v2', :notify => hipchat_notify)
		client[hipchat_room].send('mina', msg, :color => hipchat_color)
	end

end
