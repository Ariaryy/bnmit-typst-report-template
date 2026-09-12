// Everything you edit lives in this file. The rest of the template reads from
// here and derives its own geometry, so you should never need to open
// `template.typ` to change a margin, a toggle, or a name.
//
// See README.md for a field-by-field walkthrough.

// ---------------------------------------------------------------------------
// Your branch
//
// These two bindings are what make the template branch-agnostic. Change them
// and the cover, the certificate's signature block, the acknowledgement and
// the page footer all follow, because every field below refers to these
// instead of repeating the department in eight places.
// ---------------------------------------------------------------------------

#let department = (
  name: "Computer Science and Engineering",
  abbreviation: "CSE",
  hod: (name: "HOD Name", designation: "Professor and Head"),
)

#let guide = (
  name: "Mentor/Guide Name",
  designation: "Assistant Professor",
  // Usually your own department, but a guide from another one works: the
  // certificate and acknowledgement print this, not `department` above.
  department: (
    abbreviation: department.abbreviation,
    name: department.name,
  ),
)

// ---------------------------------------------------------------------------

#let config = (
  // ---- What the report is about ----------------------------------------
  title: "Your Project Title",

  subject: (
    name: "Subject Name",
    code: "23CSE175",
  ),

  // The line printed on the cover between the subject and the title. Written
  // as content (square brackets) rather than a string so the wording, the line
  // breaks and the emphasis are all yours, whatever the department asks for
  // this semester.
  cover-line: [*Report On*],

  // The award the report is submitted towards, printed on the cover and named
  // in the certificate paragraph. Change it if your programme is not a B.E.
  degree: "Bachelor of Engineering",

  // ---- Who wrote it ----------------------------------------------------
  authors: (
    (name: "Author 1", usn: "1BG23CS000"),
    (name: "Author 2", usn: "1BG23CS000"),
  ),

  guide: guide,
  department: department,

  semester: (number: 5, section: "A"),
  year: "2025-26",

  // ---- The college masthead ---------------------------------------------
  // Printed on the cover and the certificate. The accreditation line carries
  // an expiry date and a list of accredited branches, both of which change.
  institute: (
    name: "B.N.M. Institute of Technology",
    tagline: [*An Autonomous Institution under VTU*],
    accreditation: [Approved by AICTE, Accredited as grade A Institution by NAAC. All eligible branches - CSE, ECE, EEE, ISE & Mech. Engg. are accredited by NBA for academic years 2025-26 to 2027-28 and valid upto 30.06.2028],
    url: "www.bnmit.org",
  ),

  // ---- The certificate signature block ---------------------------------
  // The grid draws one column per entry, so adding or removing a signatory
  // re-flows the row on its own. Two to four entries fit comfortably; past
  // four the columns get too narrow to read.
  //
  // The first two are built from `guide` and `department` above, so they stay
  // correct for any branch without being retyped here.
  signatories: (
    (
      name: guide.name,
      lines: (
        guide.designation,
        "Dept. of " + guide.department.abbreviation,
        "BNMIT, Bengaluru",
      ),
    ),
    (
      name: department.hod.name,
      lines: (
        department.hod.designation,
        "Dept. of " + department.abbreviation,
        "BNMIT, Bengaluru",
      ),
    ),
    (
      name: "Dr. S Y Kulkarni",
      lines: ("Additional Director", "and Principal", "BNMIT, Bengaluru"),
    ),
  ),

  abstract: [
    Your abstract goes here.
  ],

  // ---- Switches --------------------------------------------------------
  options: (
    // A full-page title card before every chapter. Turn this off and each
    // chapter simply starts on a fresh page with its heading at the top.
    chapter-separators: true,

    // The decorative rectangle on the cover, certificate, acknowledgement
    // and chapter separator pages.
    border: true,

    // The two hairlines under the running head and above the running foot.
    header-rules: true,

    abstract: true,
    references: true,

    // The line under the author list on the cover naming the semester and
    // class section. Some reports are not tied to a section at all.
    class-section: true,

    // How many examiner rows appear under the certificate's signature block.
    // Set to 0 to drop the block entirely.
    external-examiners: 2,
  ),

  // ---- Geometry and type ------------------------------------------------
  layout: (
    paper: "a4",

    // The single source of truth for page geometry. The border is drawn at
    // exactly these values; body text, running head and foot, preamble pages
    // and chapter separators are all derived from them. Change this one dict
    // and the whole report moves together.
    //
    // VTU asks for 1.25in on the binding edge and 1in on the outer edge, with
    // 0.75in top and bottom.
    margin: (left: 1.25in, right: 1in, top: 0.75in, bottom: 0.75in),
  ),

  style: (
    // A running head and foot do not fit inside a 0.75in band: Typst places
    // them inside the top margin, so measuring the header from the body edge
    // leaves it a quarter inch from the paper edge, inside what most printers
    // can put ink on. Word resolves this by pushing the body down below the
    // header band. This is the width of that band, added to the top and
    // bottom margin for body pages only. The border, which appears on pages
    // that carry no header, still sits at the true 0.75in.
    header-band: 0.25in,

    // How far preamble and separator text sits inside the border, so a long
    // title or the accreditation line never runs into the rule.
    border-inset: 0.3in,
    border-stroke: 1.5pt,

    paragraph-indent: 0.5in,

    // Word's ladder is 18/16/14/12/10. The cover title and the chapter
    // separator card take 18, chapter headings 16, and body text 12, which
    // is the floor for anything that is a heading.
    text-size: (
      title: 18pt,

      // A chapter announces its number first and its name second, so the
      // label is the larger of the two lines and the name sits a step under
      // it. Front matter page titles and the reference list heading use `h1`,
      // independently of either.
      separator-label: 18pt,
      separator-title: 16pt,
      chapter-label: 16pt,
      chapter-title: 14pt,

      h1: 16pt,
      h2: 14pt,
      h3: 12pt,
      h4: 12pt,
      body: 12pt,
      caption: 10pt,
      running: 10pt,
      fine-print: 9pt,
    ),

    // 1.5 line spacing in Word terms. Typst measures the gap between lines
    // rather than the distance between baselines, hence the subtraction.
    leading: 1.5em - 0.5em,

    fonts: (
      body: "Times New Roman",
      fine-print: "Calibri",
      institute: "English111 Vivace BT",
    ),

    title-color: rgb("006ebf"),
    institute-color: rgb("f79446"),
  ),

  // ---- Bibliography ------------------------------------------------------
  // Hayagriva's own YAML format. See README.md, and
  // https://github.com/typst/hayagriva/blob/main/docs/file-format.md
  bibliography: (path: "references.yml", style: "ieee"),
)
