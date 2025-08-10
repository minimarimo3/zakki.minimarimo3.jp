#import "@preview/shiroa:0.2.3": *

#show: book

#let n = (path, title, emoji: none) => {
  return chapter(section: none, path, title + emoji)
}

#book-meta(
  title: "ﾐﾆﾏﾘﾓの日記",
  description: "ただの日記",
  summary: [
    #prefix-chapter("index.typ")[これは何？]
    = 2025
    #n("2025/目標.typ", "目標")
    == 8月
    #n("2025/08/25-08-10.typ", "10")
    #n("2025/08/25-08-08.typ", "08")
  ]
)

// re-export page template
#import "/templates/page.typ": project, embedYT
#let book-page = project
