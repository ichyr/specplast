# Code you want to run in all environments HERE
# ...
seed_file = Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb")
puts "Populating database with #{seed_file}"
load(seed_file)