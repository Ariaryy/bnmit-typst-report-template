#import "@preview/decasify:0.10.1": titlecase

#let print-names(
  authors: (),
) = {
  let last-name = authors.remove(-1)
  let length = authors.len()
  let i = 0

  while length >= 1 {
    [*#authors.at(i).name (#authors.at(i).usn)*]

    if length > 1 {
      [, ]
    }

    length -= 1
    i += 1
  }

  [ and *#last-name.name (#last-name.usn)*]
}


#let certificate(
  title: none,
  authors: (),
  guide: (),
  subject: none,
  semester: none,
  section: none,
  year: none,
) = {
  set page(background: rect(width: 100% - 1in, height: 100% - 1in))
  set align(center + horizon)
  set text(size: 16pt, font: "Times New Roman")

  let leading = 1.5em
  let leading = leading - 0.5em

  text(
    "B.N.M. Institute of Technology\n",
    font: "English111 Vivace BT",
    rgb("f79446"),
    size: 24pt,
    stroke: 0.02857em + rgb("f79446"),
  )

  set text(size: 9pt, font: "Calibri")

  [*An Autonomous Institution under VTU*\ ]
  [Approved by AICTE, Accredited as grade A Institution by NAAC. All eligible branches - CSE, ECE, EEE, ISE & Mech. Engg. are accredited by NBA for academic years 2025-26 to 2027-28 and valid upto 30.06.2028\ URL: www.bnmit.org\ ]

  set text(size: 12pt, font: "Times New Roman", hyphenate: false)

  pad(upper([*Department of Computer Science and Engineering*\ ]))
  pad(top: -10pt, bottom: 0pt, image("/template-images/bnmit.png", width: 24%))

  underline(text([*CERTIFICATE*], size: 14pt))

  set align(left)


  set par(
    justify: true,
    leading: leading,
    first-line-indent: 2em,
  )


  [
    Certified that the #titlecase(semester.at(1)) Semester #subject Project entitled *#quote(title)* carried out by #print-names(authors: authors) bonafide students of #numbering("I", semester.at(0)) Semester B.E., *B.N.M Institute of Technology*, an Autonomous Institution under Visvesvaraya Technological University, Belagavi submitted in partial fulfillment for the Bachelor of Engineering in COMPUTER SCIENCE AND ENGINEERING, Belagavi during the year #year. It is certified that all corrections/suggestions indicated for Internal Assessment have been incorporated in the report. The #subject project report has been approved as it satisfies the academic requirements in respect of the project prescribed.
  ]

  set align(center)

  v(64pt)

  grid(
    columns: (3fr, 3fr, 3fr),
    table(
      stroke: none,
      rows: 4,
      [*#guide.at(0).name*],
      [#guide.at(0).designation],
      [Dept. of #guide.at(0).department.at(0)],
      [BNMIT, Bengaluru],
    ),
    table(
      stroke: none,
      rows: 4,
      [*HOD Name*],
      [Professor and HOD],
      [Dept. of <Dept_name>],
      [BNMIT, Bengaluru]
    ),
    table(
      stroke: none,
      rows: 4,
      [*Name*],
      [Additional Director - designation],
      [and Principal],
      [BNMIT, Bengaluru]
    ),
  )


  v(24pt)

  table(
    stroke: none,
    columns: (2fr, 2.5fr, 2fr),
    rows: 3,
    row-gutter: 12pt,
    [], [*Name*], [*Signature with Date*],
    [*Examiner 1:*], [], [],
    [*Examiner 2:*],
  )
}
