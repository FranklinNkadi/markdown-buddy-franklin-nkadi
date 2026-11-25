# AI Assistance Declaration: I used AWS Quick (generative AI assistant, accessed 2026-11-25) for Markdown structure ideas, README drafting, R Markdown formatting suggestions, and syntax review. Prompts used: see `Appendix_AI_Prompts.md` (seed, refinement, and critique/validation prompts for Steps 1-3). I verified outputs using GitHub Markdown preview, knitting the .Rmd in RStudio/Posit Cloud, and comparing structure against the tidyverse `dplyr` README. All final calculations are done by myself (computed by my R code at run time, not by AI). I am responsible for the accuracy and originality of this work.

# sales_summary.R
# Purpose: Generate a synthetic retail sales dataset and summarise
#          revenue by region and product category.
# Input : none (synthetic data is generated with a fixed seed)
# Output: synthetic_sales.csv, sales_summary.csv

library(dplyr)
library(readr)

set.seed(400)  # reproducibility

n <- 500
sales <- tibble(
  order_id = 1:n,
  region   = sample(c("North", "South", "East", "West"), n, replace = TRUE),
  category = sample(c("Electronics", "Clothing", "Grocery"), n, replace = TRUE),
  units    = sample(1:10, n, replace = TRUE),
  price    = round(runif(n, min = 5, max = 200), 2)
) |>
  mutate(revenue = units * price)

summary_tbl <- sales |>
  group_by(region, category) |>
  summarise(
    orders        = n(),
    total_units   = sum(units),
    total_revenue = round(sum(revenue), 2),
    avg_revenue   = round(mean(revenue), 2),
    .groups = "drop"
  ) |>
  arrange(desc(total_revenue))

write_csv(sales, "synthetic_sales.csv")
write_csv(summary_tbl, "sales_summary.csv")

print(summary_tbl)
