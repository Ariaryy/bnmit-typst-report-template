#let table_of_contents() = {
  show outline.entry.where(level: 1): set block(above: 2em)

  show outline: it => {
    show heading: h => {
      v(24pt)
      align(text(h, size: 16pt), center)
      v(24pt)
    }
    it
  }

  show outline.entry.where(level: 1): it => link(
    it.element.location(),
    it.indented(strong("CHAPTER " + it.prefix()), strong(it.inner())),
  )

  outline(title: [TABLE OF CONTENTS])
}
