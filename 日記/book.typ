#import "@preview/shiroa:0.2.3": *

#show: book

// 年と月を指定して、その月の最終日（日数）を返す関数
#let get-last-day-of-month(year, month) = {
  let next-year = if month == 12 { year + 1 } else { year }
  let next-month = if month == 12 { 1 } else { month + 1 }

  // 翌月の1日のdatetimeオブジェクトを作成
  let first-day-of-next-month = datetime(
    year: next-year,
    month: next-month,
    day: 1,
  )

  // 1日前の日付（＝当月の最終日）を計算
  let last-day-of-this-month = first-day-of-next-month - duration(days: 1)

  // その日付の「日」の部分だけを返す
  return last-day-of-this-month.day()
}

#let n = (path, emoji: none) => {
  let date-a = path.slice(0, -4).split("/").last().split("-")
  let date = datetime(
    year: int("20" + date-a.at(0)),
    month: int(date-a.at(1)),
    day: int(date-a.at(2))
  )
  let title = date.display("[day padding:zero]") + "（今月" + str(100 * date.day() / get-last-day-of-month(date.year(), date.month())).slice(0, 2) + "％消費済み）"

  return chapter(section: none, path, title)
}

#book-meta(
  title: "ﾐﾆﾏﾘﾓの日記",
  description: "ただの日記",
  summary: [
    #prefix-chapter("index.typ")[これは何？]
    = 雑記
    #chapter("雑記/BL規制/BL規制.typ")[BL規制]
    = 2025
    #chapter("2025/目標.typ", "目標")
    == 8月
    #n("2025/08/25-08-23.typ")
    #n("2025/08/25-08-10.typ")
    #n("2025/08/25-08-08.typ")
  ]
)

// re-export page template
#import "/templates/page.typ": project, embedYT, TODO
#let book-page = project
