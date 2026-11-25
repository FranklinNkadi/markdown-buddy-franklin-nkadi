> AI Assistance Declaration: I used AWS Quick (generative AI assistant, accessed 2026-11-25) for Markdown structure ideas, README drafting, R Markdown formatting suggestions, and syntax review. Prompts used: see `docs/Appendix_AI_Prompts.md` (seed, refinement, and critique/validation prompts for Steps 1-3). I verified outputs using GitHub Markdown preview, knitting the .Rmd in RStudio/Posit Cloud, and comparing structure against the tidyverse `dplyr` README. All final calculations are done by myself (computed by my R code at run time, not by AI). I am responsible for the accuracy and originality of this work.

# Reflection – Markdown Buddy

## 1. How did the AI tool help (strengths) in creating your documentation?

AI sped up the first draft considerably. From one short project summary it produced a complete README skeleton with headers, bullet lists, and fenced code blocks, and it reminded me of sections I would have skipped, such as **License** and **Example Code**. The critique prompt was useful as a second reviewer: it flagged untagged code blocks and suggested a Table of Contents and a Requirements table, which made the README easier to scan. For the `.Rmd`, it recommended named chunks, a YAML header with `toc` and `highlight`, and a `setup` chunk, all of which match R Markdown best practices.

## 2. What limitations or errors did you notice, and how did you validate/fix them?

- The first draft included badges for CI services that do not exist in my repository – I removed them.
- One table contained an unescaped `|` that broke rendering in GitHub preview – I escaped it.
- Some code blocks lacked language tags, so highlighting did not render – I added `r`, `bash`, and `text`.
- Section order differed from real projects. I compared it with the tidyverse `dplyr` README and moved *Installation* before *Usage*.
- AI cannot know whether code actually runs. I knitted the `.Rmd` in RStudio/Posit Cloud, confirmed every chunk executed, and added a cross-check chunk proving the summary total equals the raw-data total.

Validation methods: GitHub Markdown preview, knitting in RStudio, and side-by-side comparison with a tidyverse README.

## 3. How did you ensure ethical and responsible use of AI in this assignment?

- **Disclosure:** The AI Assistance Declaration is at the top of every file, and the README ends with an AI Assistance Disclosure section; all prompts are in `docs/Appendix_AI_Prompts.md`.
- **Privacy:** Only synthetic data generated with `set.seed(400)` was used; no real or personal data was shared with the AI.
- **No AI computation:** All numbers are produced by my R code at knit time – the AI only helped with structure and formatting.
- **Verification & ownership:** Every AI suggestion was reviewed, tested, and edited before inclusion. I take full responsibility for the accuracy and originality of the final work.
