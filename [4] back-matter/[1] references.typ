#let references() = {
  set text(size: 12pt, font: "Times New Roman", hyphenate: false)
  set page(
    margin: 1in,
    footer: none,
  )

  pad(bottom: 16pt, align(center, (text([*REFERENCES*], size: 16pt))))

  let leading = 1.5em
  let leading = leading - 0.5em


  set par(
    justify: true,
    leading: leading,
  )

  bibliography("../citations.yaml", title: none)
}
