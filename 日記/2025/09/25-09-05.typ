#import "/template.typ": 日報
#import "@preview/cheq:0.2.3": checklist
#show: checklist

#show : 本文 => 日報(
  執筆日: datetime(year: 2025, month: 09, day: 05),
  今日やる・やったこと: [
    - [ ] Androidアプリのバグ修正
  ],
  今日あった嬉しかったこと: [
  ],
  明日やりたいこと: [
  ],
  その他: [
    #include "../その他/Androidアプリ.typ"
  ]
)
