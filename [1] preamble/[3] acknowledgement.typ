#let acknowledgement(
  authors: (),
  guide: (),
  subject: none,
) = {
  set page(background: rect(width: 100% - 1in, height: 100% - 1in))
  set align(left + horizon)
  set text(size: 16pt, font: "Times New Roman", hyphenate: false)

  pad(bottom: 12pt, align(center, upper([*Acknowledgement*])))

  let leading = 1.5em
  let leading = leading - 0.5em

  set text(size: 12pt, font: "Times New Roman", hyphenate: false)

  set par(
    justify: true,
    leading: leading,
  )


  [We consider it a privilege to express through the pages of this report, a few words of gratitude to all those distinguished personalities who guided and inspired us in the completion of this #subject Project.\ \

    We would like to thank *Shri. Narayan Rao R Maanay*, Secretary, BNMEI, Bengaluru for providing an excellent academic environment in college.\ \

    We would like to thank *Prof. T J Rama Murthy*, Director, BNMIT, Bengaluru for having extended his support and encouragement during the course of work.\ \

    We would like to thank *Dr. S Y Kulkarni*, Principal and Additional Director, BNMIT, Bengaluru for his extended support and encouragement during the course of work.\ \

    We would like to express our gratitude to *Prof. Eishwar N Maanay*, Dean, BNMIT, Bengaluru for his relentless support, guidance, and encouragement.\ \

    We would like to thank *Dr. Krishnamurthy G N*, Deputy Director, BNMIT, Bengaluru for his constant encouragement.\ \

    We would like to thank *Dr. Chayadevi M L*, Professor and Head in the Department of Computer Science and Engineering, BNMIT, Bengaluru, for her support and encouragement towards the completion of the #subject Project.\ \

    We would like to express our gratitude to our guide *#guide.at(0).name*, #guide.at(0).designation in the Department of #guide.at(0).department.at(1), BNMIT, Bengaluru, who has given us all the support and guidance in completing the #subject project successfully.\ \ ]

  align(
    right,
    table(
      row-gutter: -2pt,
      stroke: none,
      columns: 2,
      ..for (name, usn) in authors {
        ([*#name*], [*(#usn)*])
      }
    ),
  )
}
