# README

#Stock Portfolio#

#Running#

'''bundle install'''

'''rake db:migrate'''

#Usage

Add admin role to user in your rails console 

'''ruby
  @user = User.find(id)
  @user.admin = true
  @user.save(validate: false)
  '''


Story board for the project


