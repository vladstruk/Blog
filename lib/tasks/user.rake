namespace :user do
  desc "TODO"
  task set_activation_code: :environment do
  	User.where(activation_code: nil).each do |user|
  	  user.update_attributes(activation_code: SecureRandom.hex)
      UsersMailer.activate(user).deliver
  	end
  end

end
