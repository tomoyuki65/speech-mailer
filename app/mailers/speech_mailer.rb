class SpeechMailer < ApplicationMailer
  #デフォルトのヘッダ情報
  #default from: "user@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.speech_mailer.sendmail.subject
  #
  def sendmail(get_text,get_address)
    #mail to: "to@example.org", subject: "ActionMailer test"
    #mail to: "juni5frei@yahoo.co.jp", subject: "ActionMailer test"
    @out_msg = get_text
    mail to: get_address, subject: "Speech Mailer Message"
  end
end
