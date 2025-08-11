#import "/template.typ": 日報
#import "@preview/cheq:0.2.3": checklist
#show: checklist

#show : 本文 => 日報(
  執筆日: datetime(year: 2025, month: 08, day: 11),
  今日やる・やったこと: [
    - [ ] 融景制御用言語の設計とサンプル記述
    - [ ] ↑ANTLRで実装開始
  ],
  今日あった嬉しかったこと: [
  ],
  明日やりたいこと: [
  ],
  その他: none
)
