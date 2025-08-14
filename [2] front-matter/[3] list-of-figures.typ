#let list_of_figures() = {
  show outline.entry.where(level: 1): set block(above: 1.2em)

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
    it.indented(it.prefix(), it.inner()),
  )

  outline(title: [LIST OF FIGURES], target: figure.where(kind: image))
}
