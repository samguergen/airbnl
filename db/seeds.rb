sam = {:first_name => "Samantha", :last_name => "Guergenenov", :age => 24, :language => "french, english, spanish", :description => "I am a very relaxed girl, who is outgoing and willing to show you Paris around and teach you french! If you like pets and longboarding, it is a plus!", :email => "sam@gmail.com", :password => "123123", :password_confirmation => "123123", :photo_url => "http://samguergen.github.io/imgs/me.png"}

jack = {:first_name => "Jack", :last_name => "LHeureux", :age => 27, :language => "french", :description => "Cool guy, outgoing and fun, love nature and pets", :email=> "jack@gmail.com", :password => "234234", :password_confirmation => "234234", :photo_url => "https://media.licdn.com/mpr/mpr/shrinknp_400_400/p/8/005/012/3b0/315ee1e.jpg" }

sammy = User.create!(sam)
jacky= User.create!(jack)

post1 =