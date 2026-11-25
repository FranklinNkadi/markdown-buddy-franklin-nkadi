> AI Assistance Declaration: I used AWS Quick (generative AI assistant, accessed 2026-11-25) for Markdown structure ideas, README drafting, R Markdown formatting suggestions, and syntax review. Prompts used: see `Appendix_AI_Prompts.md` (seed, refinement, and critique/validation prompts for Steps 1-3). I verified outputs using GitHub Markdown preview, knitting the .Rmd in RStudio/Posit Cloud, and comparing structure against the tidyverse `dplyr` README. All final calculations are done by myself (computed by my R code at run time, not by AI). I am responsible for the accuracy and originality of this work.

# Appendix – AI Prompts and Key Responses

**Tool:** AWS Quick (generative AI assistant) · **Date:** 2026-11-25

## Step 1 – Markdown Structure

### Seed Prompt
> Explain what sections a good GitHub README for an R data analysis project should include.

**Key response:**

1. Project title and short description
2. Overview / Purpose – question answered, why it matters, main findings
3. Data – source (or synthetic), contents, privacy notes
4. Project structure – folder tree
5. Requirements / Dependencies – R version and packages
6. Installation – clone repo, `install.packages()`
7. Usage – how to run scripts or knit R Markdown
8. Example code
9. Outputs / Results
10. Reproducibility notes – `set.seed()`, R version, `renv`
11. License
12. Author / Contact
13. Acknowledgements / AI disclosure

Core sections in nearly every R README: **Overview**, **Installation**, **Usage/Example**.

### Refinement Prompt
> Revise the sections list so it's concise and uses Markdown headers and bullet formatting.

**Key response:**

```markdown
# Project Title
- One-line description of the project

## Overview
- Purpose, key question, main findings

## Data
- Source (or synthetic), contents, privacy notes

## Project Structure
- Folder tree of scripts, data, outputs

## Requirements
- R version and required packages

## Installation
- Clone repo and install packages

## Usage
- How to run scripts or knit `.Rmd` files

## Example Code
- Short snippet of the main analysis

## Outputs
- Files, tables, or plots produced

## License
- License type (e.g., MIT)

## Author / Contact
- Maintainer name and contact

## AI Assistance Disclosure
- Tools used, prompts, edits made
```

### Critique/Validation Prompt
> Check the Markdown syntax for correctness and readability.

**Key response:** Syntax is valid – one H1, consistent `##` hierarchy, space after `#`, consistent `-` bullets, inline code closed. Readability suggestions: (1) blank line between header and bullet, (2) add a Table of Contents, (3) make bullets specific with real commands, (4) use language-tagged fenced code blocks.

**My verification:** Compared against the tidyverse `dplyr` README (Overview → Installation → Usage). Applied suggestions 2–4 in the final README; merged *Data* into *Overview* to keep it concise.

## Step 2 – README.md Draft

### Seed Prompt
> Here's a summary of my R project: An R script that generates 500 synthetic retail orders (seed 400) and summarises orders, units and revenue by region and category using dplyr and readr. Generate a professional README.md file using Markdown.

**Key response:** A README titled "Synthetic Retail Sales Summary (R)" with sections: Overview (purpose, synthetic data with `set.seed(400)`, analysis), Project Structure (text tree), Dependencies (R ≥ 4.1, dplyr, readr with links), Usage (`source("sales_summary.R")`), and Outputs (`synthetic_sales.csv`, `sales_summary.csv`).

### Refinement Prompt
> Add sections for Installation, Example Code, and License. Keep tone concise and professional.

**Key response:** Added Installation (numbered steps: `git clone https://github.com/FranklinNkadi/markdown-buddy-franklin-nkadi.git`, then `install.packages(c("dplyr", "readr", "rmarkdown", "knitr"))`), Example Code (a `group_by(region, category) |> summarise(orders, total_units, total_revenue)` pipeline), and License (MIT, linked).

### Critique/Validation Prompt
> Review the Markdown for syntax errors and suggest 2 improvements for clarity.

**Key response:** No syntax errors – single H1, consistent `##` sections, all code blocks closed and language-tagged, code blocks inside the numbered list correctly indented 3 spaces, valid links, consistent `-` bullets. Improvements: (1) add a Table of Contents with anchor links; (2) replace the Dependencies list with a Requirements table showing versions, escaping the pipe as `\|>` inside the table.

**My edits:** Applied both suggestions (Table of Contents + Requirements table with escaped pipe), added the AI Assistance Disclosure section, and corrected file paths to match the flat repository layout. Verified rendering in GitHub preview.

## Step 3 – R Markdown Documentation

### Seed Prompt
> Here's my R script description: sales_summary.R generates synthetic sales data and outputs synthetic_sales.csv and sales_summary.csv. Suggest Markdown formatting and code block examples.

**Key response:** Suggested (1) a YAML header (title, author, `` `r Sys.Date()` ``, `html_document`); (2) a section layout of `# Purpose`, `## Inputs`, `## Outputs`; (3) named R chunks `{r packages}`, `{r generate-data}`, `{r save-outputs}`. Tips: name every chunk, use backticks for files/functions, one step per chunk with a sentence above it.

### Refinement Prompt
> Add syntax highlighting and improve section organization (e.g., # Purpose, ## Inputs, ## Outputs).

**Key response:** Added `highlight: tango`, `toc: true`, `toc_float: true` to the YAML; reorganised into `# Purpose` → `## Inputs` → `## Outputs` (as a table) → `# Code Walkthrough` with numbered `##` steps (Load packages, Generate data, Summarise, Save outputs), one chunk each.

### Critique/Validation Prompt
> Is the Markdown consistent with RMarkdown best practices?

**Key response:** Mostly yes (complete YAML, TOC and highlighting, logical heading hierarchy, unique space-free chunk labels, one task per chunk). Recommended: (1) a `setup` chunk with `knitr::opts_chunk$set(echo = TRUE, message = FALSE, warning = FALSE)`; (2) `eval=FALSE` on the file-writing chunk; (3) show results with `knitr::kable(summary_tbl)`; (4) a verification chunk `all.equal(sum(sales$revenue), sum(summary_tbl$total_revenue))`.

**My edits:** Implemented all four recommendations in `sales_summary.Rmd`. Knitted successfully in Posit Cloud ("Output created: sales_summary.html"); `sales` = 500 obs, `summary_tbl` = 12 obs.
