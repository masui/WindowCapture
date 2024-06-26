-- 最前面のウィンドウをキャプチャしてGyazoにアップするAppleScript

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
do shell script "/usr/sbin/screencapture -x /tmp/___screen.png"

-- 最前面ウィンドウの部分を切り取る
-- convert(ImageMagick)のパス指定が必要
set cropCommand to "/usr/local/bin/convert /tmp/___screen.png -crop " & windowWidth & "x" & windowHeight & "+" & xPos & "+" & yPos & " /tmp/___gyazo.png"
do shell script cropCommand

-- Gyazoにアップする
do shell script "/Applications/Gyazo.app/Contents/MacOS/Gyazo /tmp/___gyazo.png"

