/*
#import "/template.typ": 日報

#show : 本文 => 日報(
  執筆日: datetime(year: 2025, month: 08, day: 6),
  今日やること: [

  ],
  今日やったこと: [

  ],
  今日あった嬉しかったこと: [

  ],
  明日やりたいこと: [

  ],
  その他: none
)
*/

#import "@preview/shiroa:0.2.3": *

#show: book

#let n = (date, emoji: none) => {
  return chapter(section: none, str(date) + ".typ", date + emoji)
}

#book-meta(
  title: "ﾐﾆﾏﾘﾓの日記",
  description: "ただの日記",
  summary: [
    #prefix-chapter("index.typ")[これは何？]
    = 2025
    #n("2025/目標")
    == 8月
    #n("2025/08/25-08-09")
    #n("2025/08/25-08-08")
    #n("2025/08/25-08-07")
    #n("2025/08/25-08-06")
  ]
)

// re-export page template
#import "/templates/page.typ": project, embedYT
#let book-page = project
