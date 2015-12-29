class UsersMailer < ActionMailer::Base
    default :from => "Liongram <hello@liongram.com>"

    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.name} <#{user.email}>",
             :subject => "Liongram Confirmation")
    end
 end
 