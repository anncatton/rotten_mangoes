class UserMailer < ActionMailer::Base

  default from: 'notifications@rotten_mangoes.com'
 
  def delete_email(user)
    @user = user
    # @url  = 'http://rotten_mangoes.com/login'
    mail(to: @user.email, subject: "Sorry, we had to destroy you")
  end

end
