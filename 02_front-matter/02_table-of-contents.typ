#import "../template.typ": entry-table, section-title

// Built by hand from a heading query rather than with `outline`, because the
// house style wants a three column table and `outline` emits a flat sequence
// of entries. Depth stops at level 2: `1.1` appears, `1.1.1` does not.
#let table_of_contents(config) = {
  section-title(config, [Table of Contents])

  context {
    let rows = query(heading)
      .filter(h => h.outlined and h.level <= 2)
      .map(h => {
        let number = if h.numbering == none {
          []
        } else {
          numbering(h.numbering, ..counter(heading).at(h.location()))
        }
        let page-number = str(counter(page).at(h.location()).first())
        let chapter = h.level == 1
        let style = if chapter { strong } else { it => it }
        let title = if chapter { upper(h.body) } else { h.body }

        (
          link(h.location(), pad(left: if chapter { 0em } else { 1em }, style(number))),
          link(h.location(), style(title)),
          link(h.location(), style(page-number)),
        )
      })

    entry-table(("Chapter No.", "Title", "Page No."), rows)
  }
}
