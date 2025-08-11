#import "@preview/shiroa:0.2.3": *

#show: book

#book-meta(
  title: "融景制作メモ",
  summary: [
    = はじめに
    #chapter("はじめに.typ")[はじめに]
    = コンセプト
    #chapter("コンセプト/コンセプト.typ")[コンセプト]
    #chapter("コンセプト/参考にしたもの.typ")[参考にしたもの]
  ]
)


// re-export page template
#import "/templates/page.typ": project, TODO, embedYT
#let book-page = project
