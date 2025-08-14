#let conf(
  title: none,
  authors: (),
  year: none,
  department: none,
  doc,
) = {
  let leading = 1.5em
  let leading = leading - 0.5em


  set par(justify: true, leading: leading)
  set text(
    font: "Times New Roman",
    size: 12pt,
  )

  set align(left)

  set block(spacing: leading)

  show figure.where(kind: image): set figure(
    supplement: [Fig.],
    numbering: (..nums) => {
      let chapter-num = counter(heading).get().first()
      let fig-num = nums.pos().first()
      str(chapter-num) + "." + str(fig-num)
    },
  )

  show figure.where(kind: table): set figure(
    supplement: [Table],
    numbering: (..nums) => {
      let chapter-num = counter(heading).get().first()
      let fig-num = nums.pos().first()
      str(chapter-num) + "." + str(fig-num)
    },
  )

  set heading(
    numbering: (..nums) => {
      let level = nums.pos().len()
      if (level == 1) {
        numbering("1", ..nums)
      } else {
        numbering("1.", ..nums)
      }
    },
  )

  show heading.where(level: 2): it => {
    v(leading)
    it
    v(leading / 2)
  }

  show heading.where(level: 1): it => {
    page(
      background: rect(width: 100% - 1in, height: 100% - 1in),
      context {
        set align(center + horizon)
        text(16pt, "CHAPTER " + counter(heading).display(it.numbering) + "\n")
        text(16pt, upper(it.body))
      },
    )
    block(width: 100%)[
      #context {
        text(16pt, "CHAPTER " + counter(heading).display(it.numbering))
      }
      #set align(center)
      #set text(16pt, weight: "bold")
      #(it.body)]
    v(leading)
  }


  let no_header_pages = state("no_hp")
  let no_footer_pages = state("no_fp")

  context {
    let chapters = query(
      heading.where(
        level: 1,
        outlined: true,
      ),
    )

    let nh_pages = ()
    let nf_pages = ()

    for chapter in chapters {
      let page = chapter.location().page()
      nh_pages.push(page)
      nh_pages.push(page + 1)
      nf_pages.push(page)
    }

    no_header_pages.update(nh_pages)
    no_footer_pages.update(nf_pages)
  }

  set page(
    background: none,
    paper: "a4",
    margin: 1in,
    header: context {
      if not no_header_pages.get().contains(here().page()) {
        grid(
          gutter: 6pt,
          rows: 2,
          title,
          align: left,
          grid(
            rows: 2,
            gutter: 2pt,
            line(length: 100%, stroke: 0.5pt),
            line(length: 100%, stroke: 1pt),
          ),
        )
      }
    },
    footer: context {
      if not no_footer_pages.get().contains(here().page()) {
        grid(
          grid(
            rows: 2,
            gutter: 2pt,
            line(length: 100%, stroke: 0.5pt),
            line(length: 100%, stroke: 1pt),
          ),
          gutter: 6pt,
          rows: 2,
          grid(
            columns: 3,
            block(width: 100%, "Dept. of " + department.abbreviation + ", BNMIT"),
            block(width: 100%, align(center, year)),
            block(width: 100%, align(right, "Page " + str(counter(page).display()))),
          ),
          align: left,
        )
      }
    },
  )
  doc
}

