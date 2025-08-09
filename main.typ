#import "template.typ": conf

#import "[1] preamble/preamble.typ": preamble
#show: preamble.with(
  title: [
    Your cool project title
  ],
  subject: [
    The subject making you make this report :(
  ],
  subject_code: [
    23CSE145
  ],
  authors: (
    (
      name: "Author 1",
      usn: "1BG23CS000",
    ),
    (
      name: "Author 2",
      usn: "1BG23CS000",
    ),
  ),
  guide: (
    (
      name: "Mentor/Guide name",
      designation: "Professor",
      department: (
        "CSE",
        "Computer Science and Engineering",
      ),
    ),
  ),
  semester: (
    4,
    "Fourth",
  ),
  section: "A",
  year: "2024-25",
)

#include "[2] front-matter/front-matter.typ"


#show: conf.with(
  title: [
    Towards Improved Modelling
  ],
)


#include "[3] chapters/[1] Introduction.typ"
#include "[3] chapters/[2] Literature Survey.typ"
#include "[3] chapters/[3] System Requirements.typ"
#include "[3] chapters/[4] Methodology & Implementation.typ"
#include "[3] chapters/[5] Result & Discussion.typ"
#include "[3] chapters/[6] Conclusion.typ"
