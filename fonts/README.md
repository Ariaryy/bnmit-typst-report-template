# Fonts

The report needs three font families that are **not** shipped with this
repository, because none of them can legally be redistributed:

| Family | Used for | Comes with |
| --- | --- | --- |
| Times New Roman | all body text, headings, the cover | Windows, Microsoft Office, macOS Office |
| Calibri | the accreditation block on the cover and certificate | Windows, Microsoft Office |
| English111 Vivace BT | the "B.N.M. Institute of Technology" script | neither; see below |

## If you are on Windows with Office installed

Times New Roman and Calibri are already there. You only need English111 Vivace
BT.

## Getting English111 Vivace BT

It is a Bitstream font. The department distributes it with the Word template,
so the quickest route is to ask for the `.ttf` from whoever has last year's
report files. Install it (double click, then Install) or drop it in this
folder.

## Installing into this folder instead

Typst reads any font in a folder passed with `--font-path`. Copy the `.ttf`
files here and compile with:

```
typst compile --root . --font-path fonts main.typ
```

The `.gitignore` keeps them out of version control. Do not commit them.

## How to tell if a font is missing

Typst does not error on a missing font, it silently substitutes another one.
Compile the report and look at the cover:

- the script line reads in a plain serif instead of a flowing script → English111 Vivace BT is missing
- the accreditation paragraph looks like Times rather than a humanist sans → Calibri is missing

You can also list what Typst can see:

```
typst fonts | grep -i "english111\|calibri\|times new"
```

All three should appear.
