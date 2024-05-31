<h1>ショートカットキーを使って最前面のウィンドウをGyazoるための試み</h1>

<ul>
  <li>Gyazoキーを押したとき最前面のウィンドウをGyazoるようにする<br>
    <img src="https://i.gyazo.com/5a432cf5753e954ceb0069d0dbb5cde4.jpg" width=200px>
  </li>
  <li>長押ししたときは普通に領域選択してGyazoる</li>
  <li>AppleScriptとKarabiner-elementsで実現する</li>
  <li>screepcaptureコマンドでは最前面のウィンドウを自動取得できないので全画面キャプチャからconvertコマンドで切り出す</li>
  <li><code>gyazo.json</code>は<code>~/.config/karabiner/assets/complex_modifications/gyazo.json</code>に置く</li>
  <li><code>trial</code>は実験コード</li>
  <li>convertコマンドのパス(<code>/usr/local/bin</code>)を指定してなかったためハマった
</ul>

<h2>背景</h2>

<ul>
  <li>Gyazoはもちろん画像キャプチャツールなのだが、
    キャプチャしたときの関連情報(アプリとかURLとかOCR情報とか)が記録されるので、
    ブクマ的にもっと活用すると便利なはずである
  </li>
  <li>たとえば、ちょっと気になるツイートを見たとき、ブクマするのは面倒だが、
    ショートカットキーを押すだけだと手間が少ないし、後で検索できるし、
    もとツイートを参照するのも簡単である
  </li>
  <li>気軽にいつでもGyazoキーを押すことで軽い情報をじゃんじゃん記録できるはず</li>
  <li>今のところうまくいきそうな感じがしている (2024/6/1)</li>
</ul>

<h2>ChatGPTの利用</h2>

<ul>
  <li>windowcapture.asのコードはChatGPTに教えてもらった</li>
  <li>プロンプトは以下のとおり
    <pre>
Macの最前面ウィンドウのサイズと位置を知る方法を教えて
この情報を使って全画面キャプチャ画像からウィンドウのキャプチャ画面を得るコードを教えて
imagemagickを使えませんか
良いですね。その方法で全画面キャプチャの一部を切り取る事ができました。ではさっきの、最前面のウィンドウの\\
座標を取得するAppleScriptと組み合わせて、最前面のウィンドウだけをキャプチャするツールを作ってください
全部AppleScriptでできないでしょうか?
これで良いですが、retinaディスプレイだとサイズがおかしくなります。どう対応すれば良いでしょうか?
    </pre>
  </li>
</ul>


