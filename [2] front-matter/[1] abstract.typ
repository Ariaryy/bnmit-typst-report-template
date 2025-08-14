#let abstract(
  abstract_content,
) = {
  pad(bottom: 16pt, align(center, (text([*ABSTRACT*], size: 16pt))))

  let leading = 1.5em
  let leading = leading - 0.5em


  set par(
    justify: true,
    leading: leading,
  )

  abstract_content
}
