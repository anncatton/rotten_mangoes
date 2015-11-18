class UserMailer < ActionMailer::Base

  default from: 'notifications@rotten_mangoes.com'
  layout 'mailer'
 
  def delete_email(user_id)
    @user = User.find(user_id)
    # @url  = 'http://rotten_mangoes.com/login'
    mail(to: @user.email, subject: "Sorry, we had to destroy you")
  end

end
