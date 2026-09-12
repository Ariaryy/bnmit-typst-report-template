#import "../template.typ": fit-page, plate

// `k` is the fit-page scale factor; see `fit-page` in template.typ. The
// acknowledgement is conventionally one page, so if you add a paragraph or a
// fourth team member it shrinks rather than running over.
#let acknowledgement-body(config, k) = [
  #set text(
    size: config.style.text-size.body * k,
    font: config.style.fonts.body,
  )
  #set par(justify: true, leading: config.style.leading)

  // Top-aligned with a fixed gap under the title, so a shortened or rewritten
  // acknowledgement keeps the same first line position instead of drifting up
  // the page the way vertical centring would.
  #align(center, text(size: config.style.text-size.h1 * k, weight: "bold", upper[Acknowledgement]))
  #v(24pt * k)

  #let thanks(body) = { body; parbreak(); v(0.4em) }

  #thanks[We consider it a privilege to express through the pages of this report, a few
    words of gratitude to all those distinguished personalities who guided and inspired
    us in the completion of this project as a part of *#config.subject.name*
    (#config.subject.code) course.]

  #thanks[We would like to thank *Shri. Narayan Rao R Maanay*, Secretary, BNMEI,
    Bengaluru for providing an excellent academic environment in college.]

  #thanks[We would like to thank *Prof. T J Rama Murthy*, Director, BNMIT, Bengaluru
    for having extended his support and encouragement during the course of work.]

  #thanks[We would like to thank *Dr. S Y Kulkarni*, Principal and Additional Director,
    BNMIT, Bengaluru for his extended support and encouragement during the course of work.]

  #thanks[We would like to express our gratitude to *Prof. Eishwar N Maanay*, Dean,
    BNMIT, Bengaluru for his relentless support, guidance, and encouragement.]

  #thanks[We would like to thank *Dr. Krishnamurthy G N*, Deputy Director, BNMIT,
    Bengaluru for his constant encouragement.]

  #thanks[We would like to thank *#config.department.hod*, Professor and Head in the
    Department of #config.department.name, BNMIT, Bengaluru, for the support and
    encouragement towards the completion of the #config.subject.name project.]

  #thanks[We would like to express our gratitude to our guide *#config.guide.name*,
    #config.guide.designation in the Department of #config.guide.department.name,
    BNMIT, Bengaluru, who has given us all the support and guidance in completing the
    project work as a part of the #config.subject.name (#config.subject.code) course
    successfully.]

  #v(1.5em)
  #align(
    right,
    table(
      row-gutter: -2pt,
      stroke: none,
      columns: 2,
      inset: (x: 3pt, y: 3pt),
      ..config.authors.map(a => ([*#a.name*], [*(#a.usn)*])).flatten(),
    ),
  )
]

#let acknowledgement(config) = plate(
  config,
  fit-page(k => acknowledgement-body(config, k), min-scale: 0.8),
  alignment: left + top,
)
