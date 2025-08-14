#import "[1] front.typ": front
#import "[2] certificate.typ": certificate
#import "[3] acknowledgement.typ": acknowledgement

#let preamble(
  title: none,
  department: (),
  authors: (),
  guide: (),
  subject: none,
  subject_code: none,
  semester: none,
  section: none,
  year: none,
  doc,
) = {
  front(
    title: title,
    subject: subject,
    subject_code: subject_code,
    authors: authors,
    guide: guide,
    semester: semester,
    section: section,
    year: year,
    department: department
  )

  certificate(
    title: title,
    subject: subject,
    authors: authors,
    guide: guide,
    semester: semester,
    section: section,
    department: department,
    year: year,
  )

  acknowledgement(
    subject: subject,
    authors: authors,
    guide: guide,
    department: department
  )

  doc
}
