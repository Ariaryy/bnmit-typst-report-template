#import "../template.typ": layout-of, running-footer, running-header

#let references(config) = {
  let l = layout-of(config)

  // Declared here rather than inherited because the front matter's page rule
  // is still in effect at this point: it carries no header and numbers its
  // pages in Roman numerals, while the reference list continues the Arabic
  // sequence the table of contents points at. As with a chapter, the first
  // page of the list carries no header; a list long enough to run onto a
  // second page does.
  set page(
    ..l.body,
    header: context {
      let start = query(<references-heading>).first().location().page()
      if here().page() != start { running-header(config) }
    },
    footer: running-footer(config),
  )

  set text(size: config.style.text-size.body, font: config.style.fonts.body, hyphenate: false)
  set heading(numbering: none)
  show heading.where(level: 1): set text(size: config.style.text-size.h1)

  align(center)[= REFERENCES <references-heading>]
  v(16pt)

  set par(justify: true, leading: config.style.leading)
  bibliography(
    "../" + config.bibliography.path,
    title: none,
    style: config.bibliography.style,
  )
}
