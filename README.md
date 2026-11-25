> AI Assistance Declaration: I used AWS Quick (generative AI assistant, accessed 2026-11-25) for Markdown structure ideas, README drafting, R Markdown formatting suggestions, and syntax review. Prompts used: see `Appendix_AI_Prompts.md` (seed, refinement, and critique/validation prompts for Steps 1-3). I verified outputs using GitHub Markdown preview, knitting the .Rmd in RStudio/Posit Cloud, and comparing structure against the tidyverse `dplyr` README. All final calculations are done by myself (computed by my R code at run time, not by AI). I am responsible for the accuracy and originality of this work.

# Markdown Buddy – Synthetic Sales Summary in R

A small R data analysis project that generates a **synthetic** retail sales dataset and summarises revenue by region and product category. It also demonstrates professional Markdown and R Markdown documentation created with AI assistance.

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Example Code](#example-code)
- [Outputs](#outputs)
- [License](#license)
- [AI Assistance Disclosure](#ai-assistance-disclosure)

## Overview

- **Purpose:** Practise reproducible analysis and clear documentation.
- **Data:** 500 synthetic orders generated with `set.seed(400)` – no real or personal data.
- **Analysis:** Orders, units, total revenue, and average revenue per region × category.

## Project Structure

```text
markdown-buddy-franklin-nkadi/
├── README.md               # Project documentation (this file)
├── Reflection.md           # Answers to reflection questions
├── sales_summary.R         # Main analysis script
├── sales_summary.Rmd       # R Markdown documentation of the script
├── README_outline.md       # Step 1 outline
└── Appendix_AI_Prompts.md  # All prompts and key responses
```

## Requirements

| Item    | Version |
|---------|---------|
| R       | ≥ 4.1 (native pipe `\|>`) |
| dplyr   | ≥ 1.1   |
| readr   | ≥ 2.1   |
| rmarkdown / knitr | for knitting the `.Rmd` |

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/FranklinNkadi/markdown-buddy-franklin-nkadi.git
   cd markdown-buddy-franklin-nkadi
   ```

2. Install the R packages:

   ```r
   install.packages(c("dplyr", "readr", "rmarkdown", "knitr"))
   ```

## Usage

Run the analysis script from the project root:

```r
source("sales_summary.R")
```

Render the documentation:

```r
rmarkdown::render("sales_summary.Rmd")
```

## Example Code

```r
library(dplyr)

sales |>
  group_by(region) |>
  summarise(total_revenue = sum(revenue)) |>
  arrange(desc(total_revenue))
```

## Outputs

- `synthetic_sales.csv` – the generated order-level dataset.
- `sales_summary.csv` – revenue summary by region and category.
- `sales_summary.html` – knitted R Markdown report.

## License

This project is released under the [MIT License](https://opensource.org/licenses/MIT).

## AI Assistance Disclosure

- **AI tool used:** AWS Quick (generative AI assistant), 2026-11-25.
- **Main prompts:**
  1. "Explain what sections a good GitHub README for an R data analysis project should include."
  2. "Here's a summary of my R project: [summary]. Generate a professional README.md file using Markdown."
  3. "Add sections for Installation, Example Code, and License. Keep tone concise and professional."
  4. "Review the Markdown for syntax errors and suggest 2 improvements for clarity."
  5. "Here's my R script description. Suggest Markdown formatting and code block examples."
- **Changes I made after review:**
  - Added a **Table of Contents** and a **Requirements** table (AI's two clarity suggestions).
  - Added language tags (`r`, `bash`, `text`) to every fenced code block so syntax highlighting renders.
  - Escaped the pipe character inside the table so GitHub renders it correctly.
  - Removed placeholder badges that pointed to non-existent CI services.
  - Compared section order with the tidyverse `dplyr` README and moved *Installation* before *Usage*.
- Full prompts and key responses: [`Appendix_AI_Prompts.md`](Appendix_AI_Prompts.md).
