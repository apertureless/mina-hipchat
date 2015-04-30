# Required
set_default :hipchat_token, 			-> { ENV['HIPCHAT_TOKEN'] }
set_default :hipchat_room, 			-> { ENV['HIPCHAT_ROOM'] }

# Optional
set_default :color, 						-> { ENV['HIPCHAT_COLOR'] }
set_default :notiy, 						-> { ENV['HIPCHAT_NOTIFY'] || 'true' }
set_default :hipchat_application, 		-> { ENV['HIPCHAT_APPLICATION'] || application }

# Git
set_default :deployer,          			-> { ENV['GIT_AUTHOR_NAME'] || %x[git config user.name].chomp }
set_default :deployed_revision, 		-> { ENV['GIT_COMMIT'] || %x[git rev-parse #{branch}].strip }