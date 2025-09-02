#import "/template.typ": 日報
#import "@preview/cheq:0.2.3": checklist
#show: checklist

#show : 本文 => 日報(
  執筆日: datetime(year: 2025, month: 09, day: 02),
  今日やる・やったこと: [
    - [-] Androidアプリ pie menu実装

      ああやっと終わった！

    - [ ] （可能なら）ちゃんとした画像解析
  ],
  今日あった嬉しかったこと: [
    - GitHub Copilotって学生でもお金払い必要があるとかと思ってたけど、認証後に追加されるリンクを押してクーポンを使うようになっただけっぽい。賢いモデル使えるようになってとても嬉しい。
    - pie menuが実装できたこと。
  ],
  明日やりたいこと: [
    - [ ] フォルダ機能の追加
  ],
  その他: none
)
