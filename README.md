# BNMIT report template (Typst)

A VTU/BNMIT project report in [Typst](https://typst.app): cover page,
certificate, acknowledgement, abstract, contents, list of figures and tables,
numbered chapters, and an IEEE reference list. Everything you normally change
lives in one file, `config.typ`.

Compile it as-is and you get a working example report you can read before you
delete anything.

---

## 1. Getting started

Pick whichever path matches how you work.

### Path A: the web app, no installation

Best if you have never used Typst and just want the report done.

1. Download this repository as a ZIP (green **Code** button on GitHub, then
   **Download ZIP**) and unzip it.
2. Go to [typst.app](https://typst.app) and sign in.
3. **New project**, then **Empty document**.
4. In the file panel on the left, upload every file and folder from the
   unzipped repository. Keep the structure: `01_preamble/`,
   `02_front-matter/` and the rest must stay as folders.
5. Upload your font files into `fonts/` (see [section 2](#2-fonts)).
6. Open `main.typ` and press preview. Always preview `main.typ`, even while
   you are editing a chapter: a chapter on its own has no cover, contents or
   page numbers, because `main.typ` is what applies the template.
7. Download the PDF when you are done.

The web app autosaves and lets you share the project with your team, which is
the usual reason to pick it over the CLI.

### Path B: the command line

Best if you want version control, a real editor, or a coding agent helping you
write.

```bash
# install (pick one)
winget install --id Typst.Typst      # Windows
brew install typst                   # macOS
cargo install --locked typst-cli     # anywhere with Rust

git clone <this-repo> my-report
cd my-report

typst compile --root . main.typ            # one-shot build, writes main.pdf
typst watch  --root . main.typ             # rebuild on every save
```

Always compile `main.typ`. A chapter file on its own renders as a few unstyled
pages with no cover, contents or page numbers, because `main.typ` is what
applies the template. In VS Code with Tinymist, run **Typst: Pin main file** on
`main.typ` once, otherwise the preview follows whichever file you are editing.

`--root .` matters. The template refers to images with absolute paths like
`/template-images/bnmit.png`, and `--root` is what defines where `/` points.

For live preview while editing, install the **Tinymist Typst** extension in
VS Code and open the folder. It handles `--root` on its own.

### Path C: with a coding agent

The template is written so an agent can edit it without reading all of it.
Point it at `config.typ` for anything about the report's identity or layout,
and at `03_chapters/` for content. A useful opening instruction:

> Read `config.typ` and `README.md`. All report metadata, toggles and geometry
> live in `config.typ`; do not change `template.typ` or `report.typ` unless I
> ask for a structural change. Chapters are in `03_chapters/`, one file per
> chapter, included in order from `main.typ`. Compile with
> `typst compile --root . main.typ`.

---

## 2. Fonts

**Read this before you decide the template is broken.** Typst substitutes a
missing font silently instead of failing, so a missing font looks like a design
problem rather than a setup problem.

Three families are needed and none ship with this repository, because none are
redistributable:

| Family | Used for |
| --- | --- |
| Times New Roman | everything except the two below |
| Calibri | the accreditation block on the cover and certificate |
| English111 Vivace BT | the "B.N.M. Institute of Technology" script line |

On Windows with Office installed, the first two are already there. The third
you will have to get from the department's Word template, or from whoever has
last year's report files.

See [`fonts/README.md`](fonts/README.md) for where to put them and how to check
they were found.

---

## 3. `config.typ`

One file, one dictionary. Nothing else needs editing to change a name, a margin
or a switch.

### Identity

| Key | What it does |
| --- | --- |
| `title` | project title; appears on the cover, the certificate and every page header |
| `subject.name`, `subject.code` | printed on the cover and woven into the acknowledgement |
| `cover-line` | the line above the title, e.g. `[*Report On*]`. Content rather than a string, so you can change wording, line breaks and emphasis freely |
| `authors` | list of `(name, usn)`; drives the cover, the certificate and the acknowledgement sign-off |
| `guide` | the project guide's name, designation and department |
| `department` | name, abbreviation (used in the page footer) and HOD |
| `degree` | the award the report is submitted towards, e.g. "Bachelor of Engineering" |
| `semester` | `(number, section)`; the number is printed as a Roman numeral |
| `year` | academic year, printed on the cover and in every page footer |
| `institute` | the college masthead: name, tagline, accreditation paragraph, URL. The accreditation line carries an expiry date and a branch list, both of which change, which is why it lives here |
| `abstract` | the abstract, as content |

### Using this for another branch

`department` and `guide` are bound at the top of `config.typ`, above the
dictionary, and everything else refers to them. Changing those two is the whole
job:

```typst
#let department = (
  name: "Electronics and Communication Engineering",
  abbreviation: "ECE",
  hod: (name: "...", designation: "Professor and Head"),
)
```

That one edit updates the cover, the `Department of ...` line, the certificate
paragraph and its signature block, the acknowledgement, and the `Dept. of ECE,
BNMIT` in every page footer. Nothing in the template hardcodes a branch.

Two things you may also want to change: `degree`, if your programme is not
called Bachelor of Engineering, and `institute.accreditation`, which lists the
accredited branches and carries an expiry date.

### `signatories`

A list. The certificate draws one column per entry, so removing the principal
or adding a fourth name re-flows the row on its own. Each entry is a `name`
plus a tuple of `lines` printed under it.

Two to four entries lay out well. Past four the columns get too narrow to read.

### `options`

| Switch | Default | Effect |
| --- | --- | --- |
| `chapter-separators` | `true` | a full-page title card before every chapter. Off means each chapter starts on a fresh page with its heading at the top |
| `border` | `true` | the decorative rectangle on the cover, certificate, acknowledgement and separator pages |
| `header-rules` | `true` | the two hairlines under the running head and above the running foot |
| `abstract` | `true` | include the abstract page |
| `references` | `true` | include the reference list. Turning it off still loads the bibliography, so existing `@citations` keep compiling and keep rendering as `[1]` |
| `cover-section` | `true` | the `V "A" Section` line on the cover, under the author list |
| `external-examiners` | `2` | how many `Examiner N:` rows appear on the certificate. `0` removes the block |

### `layout.margin`

The single source of truth for page geometry. Everything else derives from it:

- the decorative border is drawn at exactly these values
- body pages use the same left and right, with top and bottom raised by
  `style.header-band` to make room for the running head and foot
- the cover, certificate, acknowledgement and separator pages hold their text
  `style.border-inset` inside the border

Change this one dict and the whole report moves together. VTU asks for
`(left: 1.25in, right: 1in, top: 0.75in, bottom: 0.75in)`, which is the
default.

Why body pages get a taller margin: a running head does not fit inside a 0.75in
band. Typst places headers inside the top margin, so measuring the header from
the body edge leaves it a quarter inch from the paper edge, inside what most
printers can put ink on. Word solves the same problem by pushing the body down
below the header band, which is what `header-band` reproduces. The border, which
only appears on pages that carry no header, still sits at the true 0.75in.

### `style`

`border-stroke`, `border-inset`, `paragraph-indent`, `leading`, the colours, the
font families, and `text-size`, which holds the whole type ladder.

Hyphenation is off everywhere, the way Word behaves by default, so justified
text pays for it in word spacing rather than in broken words.

The ladder:

| Element | Size |
| --- | --- |
| cover title, separator page's "CHAPTER N" label | 18 pt |
| separator page's chapter title, front matter titles, reference list heading, the "CHAPTER N" label above a chapter's text | 16 pt |
| chapter title above a chapter's text | 14 pt |
| level 2 heading | 14 pt |
| level 3 and 4 headings | 12 pt |
| body text | 12 pt |
| figure and table captions | 10 pt bold |
| running head and foot | 10 pt |

Word allows 18/16/14/12/10, and a heading is never set smaller than the text it
introduces, which is why levels 3 and 4 sit at body size and separate themselves
by weight and slant instead.

A chapter announces itself with "CHAPTER N" first and its name second, so the
label is the larger of the two lines on both the separator page and above the
chapter's running text.

---

## 4. Writing the report

### Chapters

One file per chapter in `03_chapters/`, listed in order at the bottom of
`main.typ`. To add a chapter, create the file and add an `#include` line. To
drop one, delete the line.

Each file starts with a level-1 heading, which becomes the chapter:

```typst
= Literature Survey

== A section          // numbered 2.1, appears in the contents
=== A subsection      // numbered 2.1.1, does not appear in the contents
==== Deeper still     // numbered 2.1.1.1, bold italic at body size
```

Chapter numbering, the separator page, the figure and table counters and the
equation counter are all handled for you.

`03_chapters/01_introduction.typ` ships as a working example of every construct
below. Read it once, then replace it.

### Figures

Put your images in `report-images/` and refer to them from the project root:

```typst
#figure(
  image("/report-images/architecture.png", width: 80%),
  caption: [System architecture],
) <fig-architecture>

As shown in @fig-architecture, ...
```

Figures number per chapter (`2.1`, `2.2`) with the caption below, and appear in
the List of Figures automatically.

### Tables

```typst
#figure(
  table(
    columns: 3,
    table.header([*Requirement*], [*Type*], [*Priority*]),
    [Authentication], [Functional], [High],
  ),
  caption: [Functional requirements],
) <tab-requirements>
```

Table captions sit above the table, which is the convention the department
expects. Long tables break across pages instead of being pushed off the bottom
of one.

### Equations

```typst
$ F = G (m_1 m_2) / r^2 $ <eq-gravity>
```

Numbered per chapter, right aligned.

### Citations

Entries go in `references.yml`, in [Hayagriva's YAML
format](https://github.com/typst/hayagriva/blob/main/docs/file-format.md):

```yaml
smith2024:
  type: article
  title: A Paper Worth Citing
  author: ["Smith, Jane", "Doe, John"]
  date: 2024
  parent:
    type: periodical
    title: Journal of Something
    volume: 12
  url: https://example.com/paper
```

Cite it with `@smith2024`. The reference list builds itself at the end of the
report in IEEE style. Change the style with `bibliography.style` in
`config.typ`.

If you already have a `.bib` file, drop it in and point `bibliography.path` at
it. Typst reads BibTeX too.

---

## 5. Printing

Print at **Actual Size** or **100%**. Do not use **Fit**, **Fit to printable
area** or **Shrink oversized pages**.

Those options scale an A4 page down to clear the printer's unprintable edge,
typically to around 95%, which pulls every margin inwards by the same
percentage. A 1.25in margin comes out at roughly 1.33in and a 0.75in top margin
at roughly 0.98in, with nothing wrong in the file.

To check your print shop before committing to a full run:

```bash
typst compile --root . calibration.typ
```

Print that single page the same way you would print the report, and measure the
two bars on it. The page tells you what to do with the result. One sheet is
cheaper than arguing with a template that was already correct.

---

## 6. Repository map

```
config.typ                 everything you edit
main.typ                   which chapters are included, in what order
report.typ                 what order the parts of the document go in
template.typ               derived geometry, running head and foot, shared furniture
calibration.typ            one-page print test

01_preamble/               cover, certificate, acknowledgement
02_front-matter/           abstract, contents, list of figures, list of tables
03_chapters/               your content, one file per chapter
04_back-matter/            reference list

references.yml             bibliography entries
report-images/             your figures
template-images/           college and university logos
fonts/                     drop the three font files here (gitignored)
```

`template.typ` and `report.typ` are the machinery. You should not need to open
either one to produce a report.
