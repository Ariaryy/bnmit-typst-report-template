#import "[1] abstract.typ": abstract
#import "[2] table-of-contents.typ": table_of_contents
#import "[3] list-of-figures.typ": list_of_figures
#import "[4] list-of-tables.typ": list_of_tables

#let front_matter(
  abstract_content: none,
  year: none,
  department: none,
  doc,
) = {
  counter(page).update(1)
  set text(size: 12pt, font: "Times New Roman", hyphenate: false)
  set page(
    margin: 1in,
    footer: context grid(
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
        block(width: 100%, align(right, "Page " + str(counter(page).display("I")))),
      ),
      align: left,
    ),
  )

  abstract(abstract_content)
  pagebreak()

  table_of_contents()
  pagebreak()

  context {
    let figures = query(figure.where(kind: image))
    if figures.len() > 0 {
      list_of_figures()
      pagebreak()
    }
  }

  context {
    let tables = query(figure.where(kind: table))
    if tables.len() > 0 {
      list_of_tables()
      pagebreak()
    }
  }

  counter(page).update(1)
  doc
}
