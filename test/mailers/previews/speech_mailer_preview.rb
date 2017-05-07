# Preview all emails at http://localhost:3000/rails/mailers/speech_mailer
class SpeechMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/speech_mailer/sendmail
  def sendmail
    SpeechMailer.sendmail
  end

end
