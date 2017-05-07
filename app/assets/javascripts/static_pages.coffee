# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
####################
# グローバル変数定義
####################
# 音声認識の開始・停止フラグ
nowRecognition = false

####################
# 音声認識関数
####################
this.vr_function = ->
  ####################
  # メール送信処理
  ####################
  proc_mail_send  = (msg, address) ->
    $.ajax({url: 'static_pages/send_message', type: 'GET', datatype: 'text', data: {p1: msg, p2: address}})

  ####################
  # 終了処理
  ####################
  proc_stop = ->
    # Web Speech API 終了処理
    recognition.stop()

  ####################
  # 開始処理
  ####################
  proc_start = ->
    recognition = new webkitSpeechRecognition()
    # 言語設定：「ja-JP」or「en-US」
    recognition.lang = document.querySelector('#select_lang').value
    # 認識処理中の中間状態の候補取得設定を有効
    recognition.interimResults = true
    # 中間状態が認識中の場合
    recognition.onsoundstart = ->
      document.getElementById('status').innerHTML = "認識中"
    # 中間状態がマッチする認識無し
    recognition.onnomatch = ->
      document.getElementById('status').innerHTML = "もう一度試してください"
    # 中間状態がエラーの場合
    recognition.onerror = ->
      # 開始処理を再実行
      proc_start()
    # 中間状態が停止中の場合
    recognition.onsoundend = ->
      if (nowRecognition == false)
        document.getElementById('status').innerHTML = "停止中"
        # 終了処理を実行
        proc_stop()
      else
        # 開始処理を再実行
        proc_start()
    # 音声を認識した場合
    recognition.onresult = (event) ->
      match_count = 0
      results = event.results
      for i in [event.resultIndex..results.length]
        # 認識が完了した場合
        if (results[i].isFinal)
          # 検索用文字列を取得
          match_text = document.getElementById('search_text').value
          document.getElementById('result_text').innerHTML = results[i][0].transcript
          # チェック用文字列を取得
          check_text = document.getElementById('result_text').value
          # チェック用文字列に検索用文字列が含まれているかチェック
          if (match_text != "")
            if (check_text.indexOf(match_text) != -1)
              # 検索用文字列が存在した場合、メールを送信
              document.getElementById('status').innerHTML = "メールを送信しました！"
              # 送信先メールアドレスの取得
              mail_address = document.getElementById('mail_text').value
              # メール送信処理を実行
              if (mail_address != "")
                proc_mail_send(check_text,mail_address)
              else
                document.getElementById('status').innerHTML = "アドレスが未入力です！"
          # 開始処理を再実行
          proc_start()
        else
          document.getElementById('result_text').innerHTML = "[途中経過] " + results[i][0].transcript
    # Web Speech API 開始処理
    recognition.start()

  # 音声認識の開始・停止フラグが停止の場合
  if (nowRecognition)
    nowRecognition = false
    document.getElementById('status').innerHTML = "Stop"
    document.querySelector('#btn').value = '音声認識開始'
    document.querySelector('#btn').className = ''
    # 終了処理を実行
    proc_stop()
  # 上記以外（フラグが開始）の場合
  else
    nowRecognition = true
    document.getElementById('status').innerHTML = "Start"
    document.querySelector('#btn').value = '音声認識停止'
    document.querySelector('#btn').className = 'select'
    # 開始処理を実行
    proc_start()
