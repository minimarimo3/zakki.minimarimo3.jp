#import "/book.typ": book-page, embedYT

#show: book-page.with(
  description:"description"
)

= hoge

#lorem(1000)

== fuga

#lorem(500)

#figure(caption: [caption],
  ```c
  hogehgoehgoe
  ```
)

#lorem(500)


=== hoge

#lorem(10)
#embedYT("https://www.youtube.com/embed/YzuWMyd7Pjk?si=JT_svHxx0lFD_Ve6")
== tmp
#embedYT("https://www.youtube.com/embed/YzuWMyd7Pjk?si=JT_svHxx0lFD_Ve6")
#figure(caption: [hoge], ```c hoge```)
#embedYT("https://www.youtube.com/embed/YzuWMyd7Pjk?si=JT_svHxx0lFD_Ve6")
