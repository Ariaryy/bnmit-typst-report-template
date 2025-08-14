#let front(
  title: none,
  authors: (),
  guide: (),
  subject: none,
  subject_code: none,
  semester: none,
  section: none,
  year: none,
  department: ()
) = {
  set page(background: rect(width: 100% - 1in, height: 100% - 1in))
  set align(center + horizon)
  set text(size: 16pt, font: "Times New Roman")

  strong("VISVESVARAYA TECHNOLOGICAL UNIVERSITY") + "\nJNANASANGAMA, BELAGAVI - 590018"


  pad(y: -4pt, image("/template-images/vtu.png", width: 15%))

  [*#subject (#subject_code)\ Report On*\ ]
  text(strong(title), rgb("006ebf"))

  set text(size: 14pt)

  pad(text([_Submitted in partial fulfilment for the award of degree of_], size: 12pt))

  [*Bachelor of Engineering\ in\ #upper(department.name)*\ ]

  set text(size: 12pt)
  v(1pt)
  [Submitted by]
  pad(
    y: -10pt,
    table(
      row-gutter: -2pt,
      stroke: none,
      columns: 2,
      ..for (name, usn) in authors {
        (strong(name), strong(usn))
      }
    ),
  )
  [#numbering("I", semester.at(0)) #quote(section) Section\ ]
  v(1pt)
  [Under the Guidance of\ ]
  [*#guide.at(0).name*\ ]
  [#guide.at(0).designation, Dept. of #guide.at(0).department.at(0)\ ]
  [BNMIT, Bengaluru]

  pad(top: -6pt, bottom: 0pt, image("/template-images/bnmit.png", width: 24%))

  text(
    "B.N.M. Institute of Technology\n",
    font: "English111 Vivace BT",
    rgb("f79446"),
    size: 24pt,
    stroke: 0.02857em + rgb("f79446"),
  )

  set text(size: 9pt, font: "Calibri")

  [*An Autonomous Institution under VTU*\ ]
  [Approved by AICTE, Accredited as grade A Institution by NAAC. All eligible branches - CSE, ECE, EEE, ISE & Mech. Engg. are accredited by NBA for academic years 2025-26 to 2027-28 and valid upto 30.06.2028\ URL: www.bnmit.org\ \ ]

  set text(size: 16pt, font: "Times New Roman")

  [*Department of #department.name*\ ]
  underline([*#year*])
}
