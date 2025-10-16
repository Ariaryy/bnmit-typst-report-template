#let list_of_tables() = {
  show outline.entry.where(level: 1): set block(above: 1.2em)
  show outline: it => {
    show heading: h => {
      v(24pt)
      align(text(h, size: 16pt), center)
      set text(size: 14pt)
      v(24pt)
            grid(columns: (3fr, 5fr, 3fr),
    align([*TABLES*],center), align([*DESCRIPTION*],center), align([*PAGE NO.*], center)
    )
    }
    it
  }

  show outline.entry.where(level: 1): it => link(
    it.element.location(),
    grid(columns: (3fr, 5fr, 3fr),
    align(it.prefix(),center), align(it.body(),center), align(it.page(), center)
    )
  )

  outline(title: [LIST OF TABLES], target: figure.where(kind: table))
}