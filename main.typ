// Edit config.typ for everything about your report. Edit the chapter files
// for its contents. This file only decides which chapters are included and in
// what order.

#import "config.typ": config
#import "report.typ": report

#show: report.with(config)

#include "03_chapters/01_introduction.typ"
#include "03_chapters/02_literature-survey.typ"
#include "03_chapters/03_system-requirements.typ"
#include "03_chapters/04_methodology-implementation.typ"
#include "03_chapters/05_results-discussion.typ"
#include "03_chapters/06_conclusion.typ"
