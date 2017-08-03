class NoticeMailer < ApplicationMailer
  default from: "tasuke0821@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(user)
    @greeting = "I've arrived!"

    mail to: "tasuke0821@gmail.com", subject: "Notification from naviasta"
  end
end
