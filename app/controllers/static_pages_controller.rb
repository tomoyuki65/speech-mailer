class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def use
  end

  def contact
  end

  # メール送信アクション
  def send_message
    # 受信パラメータを取得
    speech_text = params['p1']
    send_to_address = params['p2']
    # メール送信を実行
    SpeechMailer::sendmail(speech_text,send_to_address).deliver
    # レンダリング無し
    render nothing: true
  end

end
