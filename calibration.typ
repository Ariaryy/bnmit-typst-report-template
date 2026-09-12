// A one-sheet print test. Compile it, print it the same way you print the
// report, and measure the two bars with a ruler.
//
//   typst compile --root . calibration.typ
//
// If the 10 cm bar measures 10.0 cm, your printer is at 100% and the report's
// margins land exactly where config.typ says they do. If it measures short
// (around 9.5 cm is typical), the print dialog is scaling the page to fit the
// printer's unprintable border, and every margin in the report is being pulled
// inwards by the same percentage. Fix it in the dialog, not in the template:
// choose "Actual Size" or "100%" instead of "Fit" or "Shrink oversized pages".

#import "config.typ": config

#set page(paper: config.layout.paper, margin: 0pt, header: none, footer: none)
#set text(font: config.style.fonts.body, size: 10pt)

#let m = config.layout.margin
#let rule-stroke = 0.4pt
#let label(body) = text(7pt, body)

// The report's own border, drawn at exactly the configured margin.
#place(
  top + left,
  pad(
    left: m.left, right: m.right, top: m.top, bottom: m.bottom,
    rect(width: 100%, height: 100%, stroke: config.style.border-stroke),
  ),
)

// Rulers along the top and left edges, ticked every inch from the paper edge.
//
// A tick has to run perpendicular to the edge it measures, or it marks nothing:
// the top ruler's ticks point down the page and the left ruler's point across
// it. Labels are centred on their tick rather than placed at it, since `place`
// anchors content by its corner and an uncentred label sits a character's width
// off the mark it names.
#let tick-length = 0.25in
#let label-box = 0.6in

// Stops at 7in: A4 is 8.27in wide, so an 8in label would run off the sheet.
#for i in range(1, 8) {
  place(top + left, dx: i * 1in, line(length: tick-length, angle: 90deg, stroke: rule-stroke))
  place(
    top + left,
    dx: i * 1in - label-box / 2,
    dy: tick-length + 2pt,
    box(width: label-box, align(center, label[#i in])),
  )
}

#for i in range(1, 12) {
  place(top + left, dy: i * 1in, line(length: tick-length, angle: 0deg, stroke: rule-stroke))
  place(
    top + left,
    dx: tick-length + 3pt,
    dy: i * 1in - 0.5 * 1em,
    box(height: 1em, align(horizon, label[#i in])),
  )
}

#place(top + left, dx: m.left + 0.25in, dy: m.top + 0.6in, block(
  // Held inside the border on both sides, the same way the report's own
  // preamble pages are.
  width: 100% - m.left - m.right - 0.5in,
)[
  #set par(leading: 0.75em, justify: false)

  #text(16pt, weight: "bold")[Print calibration]

  #v(0.5em)
  Measure both bars below with a ruler.

  #v(0.6em)
  *A.* Exactly *10.0 cm* long:   #v(2pt)
  #box(width: 10cm, height: 9pt, stroke: 0.6pt)

  #v(0.8em)
  *B.* Exactly *5.00 in* long:   #v(2pt)
  #box(width: 5in, height: 9pt, stroke: 0.6pt)

  #v(0.8em)
  *C.* The rectangle around this page is the report's border. It should sit
  *#m.left.inches()in* (#calc.round(m.left.cm(), digits: 2) cm) from the left
  edge, *#m.right.inches()in* (#calc.round(m.right.cm(), digits: 2) cm) from
  the right, and *#m.top.inches()in* (#calc.round(m.top.cm(), digits: 2) cm)
  from the top and bottom.

  #v(1em)
  #block(inset: 10pt, stroke: 0.5pt, width: 100%)[
    #set par(leading: 0.75em)
    *If bar A measures 10.0 cm* the printer is at 100%, so the report's margins
    land exactly where `config.typ` says. Any margin that still looks wrong is
    a template problem: change `layout.margin`.

    #v(0.5em)
    *If bar A measures short* the printer is scaling the page down to fit its
    own unprintable edge. Divide your measurement by 10 to get the factor; it
    applies to every margin equally. Set the print dialog to *Actual Size* or
    *100%* rather than *Fit* or *Shrink oversized pages*, and reprint. Do not
    compensate for this in `config.typ`, or a correctly printed copy comes out
    wrong.
  ]
])
