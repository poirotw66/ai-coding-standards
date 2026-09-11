# Data Analysis and Visualization Rules

## Data Analysis Principles

* Prefer clear, reproducible analysis pipelines.
* Keep data loading, cleaning, transformation, modeling, validation, and visualization separated.
* Avoid mutating raw input data directly. Create cleaned or transformed copies.
* Name intermediate datasets according to their analytical meaning, not their temporary role.
* Document analytical assumptions in English comments or Markdown notes.
* Make data filtering, joins, aggregations, and transformations explicit.
* Avoid unexplained magic numbers in analysis code.

## Statistical Analysis

* Before statistical testing or modeling, check relevant assumptions.
* Check multicollinearity before regression-style modeling, for example with Variance Inflation Factor.
* Validate assumptions such as:

  * Missing data patterns
  * Outliers
  * Distribution shape
  * Independence
  * Linearity
  * Homoscedasticity
  * Multicollinearity
* Clearly separate exploratory analysis from confirmatory analysis.
* Do not present statistical results without explaining the tested assumption or hypothesis.
* Report uncertainty where appropriate.

## Visualization

* Use `plotnine` for visualization by default.
* Avoid `seaborn` unless explicitly requested.
* Keep visualizations focused on one main message.
* Chart titles, labels, legends, and annotations must be clear and human-readable.
* Avoid unnecessary decoration.
* Do not hard-code colors unless the user explicitly asks for specific colors or a brand palette.

## Chinese Text in Charts

* If chart text contains Chinese, use Traditional Chinese only.
* Before rendering charts with Chinese text, set the font:

```python
plt.rcParams["font.family"] = "Noto Serif CJK JP"
```

## Notebook Rules

* Keep notebooks readable and reproducible.
* Separate narrative, setup, data loading, transformation, modeling, and visualization sections.
* Avoid hidden state caused by out-of-order notebook execution.
* Prefer small reusable functions over large notebook cells.
* Use English comments and docstrings in notebook code.
* Use Traditional Chinese only for user-facing Chinese output, chart labels, titles, or report text.

## Output Quality

* Label tables and charts clearly.
* Make units explicit.
* Avoid ambiguous column names.
* Preserve raw data separately from processed data.
* Ensure exported figures and tables can be reproduced from the notebook or script.
