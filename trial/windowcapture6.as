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

-- Retinaディスプレイ対応のため、サイズと位置を2倍にする
set xPos to xPos * 2
set yPos to yPos * 2
set windowWidth to windowWidth * 2
set windowHeight to windowHeight * 2

-- 全画面キャプチャを撮る
do shell script "screencapture -x ~/Desktop/fullscreen_capture.png"

-- 最前面ウィンドウの部分を切り取る
set cropCommand to "convert ~/Desktop/fullscreen_capture.png -crop " & windowWidth & "x" & windowHeight & "+" & xPos & "+" & yPos & " ~/Desktop/window_capture.png"
do shell script cropCommand

display dialog "ウィンドウキャプチャが完了しました。" buttons {"OK"} default button "OK"
