
#import "@preview/shiroa:0.2.3": *

#show: book

#book-meta(
  title: "融景制作メモ",
  summary: [
    #prefix-chapter("sample-page.typ")[Hello, typst]
  ]
)



// re-export page template
#import "/templates/page.typ": project
#let book-page = project
