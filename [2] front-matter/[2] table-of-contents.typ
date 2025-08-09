#set text(font: "Times New Roman", size: 12pt)

#show outline.entry.where(level: 1): set block(above: 1.2em)

#show outline: it => {
  show heading: set align(center)
  show heading: set text(size: 16pt)
  it
}

#show outline.entry.where(level: 1): it => link(
  it.element.location(),
  it.indented("CHAPTER " + it.prefix(), it.inner()),
)


#outline(title: [TABLE OF CONTENTS])

