
#import "@preview/shiroa:0.2.3": *

#show: book

#book-meta(
  title: "ﾐﾆﾏﾘﾓの備忘録",
  description: "hoge",
  summary: [
    #prefix-chapter("test.typ")[kこれはテスト]
  ]
)

// re-export page template
#import "/templates/page.typ": project, embedYT
#let book-page = project
