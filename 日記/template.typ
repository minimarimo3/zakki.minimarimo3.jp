#let 日報(
  執筆日: none,
  今日やる・やったこと: [],
  今日あった嬉しかったこと: [],
  明日やりたいこと: [],
  その他: none
) = [
#import "/book.typ": book-page

#show: book-page.with(
  title: 執筆日.display("[year]年[month]月[day]日の日報"),
  description: "日報"
)
#set heading(numbering: none)

= 今日やる・やったこと

#今日やる・やったこと

= 今日あった嬉しいこと

#今日あった嬉しかったこと

= 明日やりたいこと

#明日やりたいこと


#if その他 != none {[
= その他

#その他

]}

]
