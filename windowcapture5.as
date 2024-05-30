-- ChatGPT 4oに教えてもらった方法

-- Macの最前面ウィンドウのサイズと位置を知る方法を教えて
-- この情報を使って全画面キャプチャ画像からウィンドウのキャプチャ画面を得るコードを教えて
-- imagemagickを使えませんか
-- 良いですね。その方法で全画面キャプチャの一部を切り取る事ができました。ではさっきの、最前面のウィンドウの座標を取得するAppleScriptと組み合わせて、最前面のウィンドウだけをキャプチャするツールを作ってください
-- 全部AppleScriptでできないでしょうか?
-- これで良いですが、retinaディスプレイだとサイズがおかしくなります。どう対応すれば良いでしょうか?

-- 最前面のウィンドウの座標とサイズを取得
tell application "System Events"
    tell (first application process whose frontmost is true)
        set frontApp to name
        tell window 1
            set {xPos, yPos} to position
            set {windowWidth, windowHeight} to size
        end tell
    end tell
end tell

-- 全画面キャプチャを撮る
do shell script "screencapture -x ~/Desktop/fullscreen_capture.png"

-- 最前面ウィンドウの部分を切り取る
-- retinaだと2倍する
set cropCommand to "convert ~/Desktop/fullscreen_capture.png -crop " & windowWidth * 2 & "x" & windowHeight * 2 & "+" & xPos * 2 & "+" & yPos * 2 & " ~/Desktop/window_capture.png"
do shell script cropCommand

return  cropCommand

-- display dialog "ウィンドウキャプチャが完了しました。" buttons {"OK"} default button "OK"
