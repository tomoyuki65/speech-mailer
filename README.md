# speech-mailer
-------------------
-- 概要
-------------------
音声認識によるメール配信アプリケーション。
マイクから音声認識した内容をテキスト変換し、
画面へ出力および、必要に応じて検索文字を
トリガーに認識内容を自動メール送信する。

-------------------
-- 注意事項
-------------------
・Gmailアカウントでメール送信が可能です。
  メール設定はコメントアウトしているため、
  使用する場合は以下を設定して下さい。
  ①environmentsの設定
    開発環境パス：/config/environments/development.rb
    本番環境パス：/config/environments/production.rb

    # Gmail設定
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
  	  address:               'smtp.gmail.com',
  	  port:      	           587,
  	  domain:                'smtp.gmail.com',
  	  user_name:             'GmailアカウントID',
  	  password:              'Gmailアカウントのパスワード',
  	  authentication:        'plain',
  	  enable_starttls_auto:  true
    }

  ②speech_mailer.rbの設定
    default from: "送信元Gmailアドレス"

・Herokuにデプロイ時には、production.rbの
  assets.compileを「true」にする必要があります。
  config.assets.compile = true
