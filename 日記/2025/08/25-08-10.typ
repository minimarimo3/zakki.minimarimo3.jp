#import "/template.typ": 日報
#import "@preview/cheq:0.2.3": checklist
#show: checklist

#show : 本文 => 日報(
  執筆日: datetime(year: 2025, month: 08, day: 9),
  今日やる・やったこと: [
    - [x] #link("https://github.com/minimarimo3/JabRef-Simple-Importer")[JabRefの拡張機能]を使えるところまで持っていく
    - [ ] （残り一日！）融景制御用言語の構想を練る
    - [ ] （残り一日！）融景公式サイトに言語サンプルを載せる
    - [x] 作業用Discordの作業時間出すやつ、あれを貼るためのスペースが欲しい。

    // - [ ] 
  ],
  今日あった嬉しかったこと: [
    スーパーのすしが半額以上に安くなってたので買った。美味かった。
  ],
  明日やりたいこと: [
  ],
  その他: none
)
