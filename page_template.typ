// This is important for shiroa to produce a responsive layout
// and multiple targets.
#import "@preview/shiroa:0.2.3": (
  get-page-width, is-html-target, is-pdf-target, is-web-target, plain-text, shiroa-sys-target, templates, media
)
#import templates: *

#let TODOCounter = counter("minimarimo3:TODOCounter")
#let TODO = (con) => {
  TODOCounter.step()
  text(fill: red)[TODO #context TODOCounter.display(): #con]
}



/// The site theme to use. If we renders to static HTML, it is suggested to use `starlight`.
/// otherwise, since `starlight` with dynamic SVG HTML is not supported, `mdbook` is used.
/// The `is-html-target(exclude-wrapper: true)` is currently a bit internal so you shouldn't use it other place.
#let web-theme = if is-html-target(exclude-wrapper: true) { "starlight" } else { "mdbook" }
#let is-starlight-theme = web-theme == "starlight"

// Metadata
#let page-width = get-page-width()
#let is-html-target = is-html-target()
#let is-pdf-target = is-pdf-target()
#let is-web-target = is-web-target()
#let sys-is-html-target = ("target" in dictionary(std))


#let embedYT = (url, orig_width: 560, orig_height: 315) => {
  // 20ptはpageで設定したleftの値
  let width = (page-width - 20pt)
  let height = page-width * (orig_height / orig_width)

  // 操作不能になるバグを避けるためにカスタムcssを適用する必要があります
  //  .minimarimo3-embed-YT{position: absolute ; z-index: 2;}
  align(center)[#{
    media.iframe(
      outer-width: width,
      outer-height: height,
      attributes: (
        class: "minimarimo3-embed-YT",
        src: url,
        frameborder: "0",
        allowfullscreen: "true",
        width: "100%",
        height: "100%"
      ),
    )
  }]
}

// Theme (Colors)
#let themes = theme-box-styles-from(toml("theme-style.toml"), read: it => read(it))
#let (
  default-theme: (
    style: theme-style,
    is-dark: is-dark-theme,
    is-light: is-light-theme,
    main-color: main-color,
    dash-color: dash-color,
    code-extra-colors: code-extra-colors,
  ),
) = themes;
#let (
  default-theme: default-theme,
) = themes;
#let theme-box = theme-box.with(themes: themes)

// Fonts
#let main-font = (
  // sudo apt install fonts-noto-cjkで入る
  "Noto Serif CJK JP",
  // "Charter",
  // "Source Han Serif SC",
  // "Source Han Serif TC",
  // shiroa's embedded font
  "Libertinus Serif",
)
#let code-font = (
  // "BlexMono Nerd Font Mono",
  // shiroa's embedded font
  "DejaVu Sans Mono",
)

// Sizes
#let main-size = if is-web-target {
  16pt
} else {
  10.5pt
}
#let heading-sizes = if is-web-target {
  (2, 1.5, 1.17, 1, 0.83).map(it => it * main-size)
} else {
  (26pt, 22pt, 14pt, 12pt, main-size)
}
#let list-indent = 0.5em

// Put your custom CSS here.
#let extra-css = ```css
.site-title {
  font-size: 1.2rem;
  font-weight: 600;
  font-style: italic;
}
/* これしないとheading上下のembedが操作できない(v0.3.1-rc3) 
.minimarimo3-embed-YT{position: absolute ; z-index: 2;}*/
.minimarimo3-embed-YT {
    width: 100% !important;
    height: 100% !important;
    position: static !important;
    z-index: 2;
}
```

/// The project function defines how your document looks.
/// It takes your content and some metadata and formats it.
/// Go ahead and customize it to your liking!
#let project(title: "ﾐﾆﾏﾘﾓの雑記", description: none, authors: ("minimarimo3"), kind: "page", plain-body) = {
  // set basic document metadata
  set document(
    author: authors,
    title: title,
  ) if not is-pdf-target

  // set web/pdf page properties
  set page(
    numbering: none,
    number-align: center,
    width: page-width,
  ) if not (sys-is-html-target or is-html-target)

  // remove margins for web target
  set page(
    margin: (
      // reserved beautiful top margin
      top: 20pt,
      // reserved for our heading style.
      // If you apply a different heading style, you may remove it.
      left: 20pt,
      // Typst is setting the page's bottom to the baseline of the last line of text. So bad :(.
      bottom: 0.5em,
      // remove rest margins.
      rest: 0pt,
    ),
    height: auto,
  ) if is-web-target and not is-html-target

  let common = (
    web-theme: web-theme,
  )

  show: template-rules.with(
    // book-meta: include "/github-pages/docs/book.typ",
    book-meta: include "/book.typ",
    title: title,
    description: description,
    plain-body: plain-body,
    extra-assets: (extra-css,),
    ..common,
  )

  // Set main text
  set text(
    font: main-font,
    size: main-size,
    fill: main-color,
    lang: "jp",
  )

  // 画像にはキャプション（alt）を必ずつける
  //  ただし、24-12-29時点ではaltが反映されないようです
  show image: it => {
    return {
      if it.alt == none {
        TODO("画像にはキャプションをつける必要があります")
      }
      it
    }
  }  


  // 表のキャプションを上に変更
  show figure.where(kind: table): set figure.caption(position: top)

  // コードのサプリメント（図とか表ってやつ）はコード
  show figure.where(kind: raw): set figure(supplement: "コード")

  // 引用はsist02形式で行う
  set bibliography(style: "sist02")


  // 脚注と本文の合間を.の繰り返しで表現
  set footnote.entry(separator: repeat[.])

  // 見出しにインデントをつける。ページ数とかは非表示
  //  https://typst.app/docs/reference/model/outline/#:~:text=Building%20an%20outline%20entry%20from%20its%20parts
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.body()),
  )

  set heading(numbering: "1.")
  // 見出しの左側に#をつける。あとサイズを合わせる
  show heading: set text(weight: "bold") if is-web-target
  show heading: it => {
    let it = {
      set text(size: heading-sizes.at(it.level, default: main-size))
      place(left, dx: -20pt)[\#]
      it
    }

    block(
      spacing: 0.7em * 1.5 * 1.2,
      below: 0.7em * 1.2,
      it,
    )
  }

  // リンクの色変更
  show link: set text(fill: dash-color)
  // リンクにはアンダーラインを引く
  show link: underline


  // コードブロックの設定
  show raw: it => {
    set text(font: code-font, size: 13pt)
    if "block" in it.fields() and it.block {
      rect(
        width: 100%,
        inset: (x: 4pt, y: 5pt),
        radius: 4pt,
        fill: code-extra-colors.bg,
        [
          // コードを左寄せ
          #set align(left)
          #set text(fill: code-extra-colors.fg) if code-extra-colors.fg != none
          #set par(justify: false)
          // 言語を右端に表示
          #place(right, text(luma(110), it.lang))
          #it
        ],
      )
    } else {
      it
    }
  }


  // markup setting
  show: markup-rules.with(
    ..common,
    themes: themes,
    heading-sizes: heading-sizes,
    list-indent: list-indent,
    main-size: main-size,
  )
  // math setting
  show: equation-rules.with(..common, theme-box: theme-box)
  // code block setting
  show: code-block-rules.with(..common, themes: themes, code-font: code-font)

  outline(title: "目次")

  repeat([.])

  // Main body.
  set par(justify: true)

  plain-body
}

#let part-style = heading
