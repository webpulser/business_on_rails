# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bor_session',
  :secret      => '0c26240fc77edfea24493ef4548f2e408bd931f7efd568fb771e71e237076fbbd7824b6b394e68e64cf7b157bd594103d73ea7ddd086fab2d57848f0ffb568ac'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
