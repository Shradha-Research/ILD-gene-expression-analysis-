# ============================================================
# Project 1: Extract final DEG gene list
# Input: limma results with probe-level statistics
# Output: clean gene-level DEG list for Project 2
# ============================================================

library(dplyr)

# ---- sanity check: required objects ----
required_objects <- c("results", "expr_sub")
missing <- setdiff(required_objects, ls())

if (length(missing) > 0) {
  stop(paste("Missing objects in environment:", paste(missing, collapse = ", ")))
}

# ---- load platform annotation (GPL14550) ----
library(GEOquery)

gpl <- getGEO("GPL14550")
gpl_table <- Table(gpl)

annotation <- gpl_table[, c("ID", "GENE_SYMBOL")]

# ---- add probe IDs to results ----
results$ProbeID <- rownames(results)

# ---- merge results with gene symbols ----
deg_annot <- merge(
  results,
  annotation,
  by.x = "ProbeID",
  by.y = "ID",
  all.x = TRUE
)

# ---- filter significant DEGs ----
deg_filtered <- deg_annot %>%
  filter(
    adj.P.Val < 0.05,
    abs(logFC) >= 1,
    !is.na(GENE_SYMBOL),
    GENE_SYMBOL != ""
  )

# ---- collapse to gene-level list ----
gene_list <- deg_filtered %>%
  select(GENE_SYMBOL, logFC, adj.P.Val) %>%
  distinct(GENE_SYMBOL, .keep_all = TRUE) %>%
  mutate(Direction = ifelse(logFC > 0, "Upregulated", "Downregulated"))

# ---- sanity checks ----
cat("Number of DEGs:", nrow(gene_list), "\n")
print(table(gene_list$Direction))

# ---- save for Project 2 ----
write.csv(
  gene_list,
  "project1_differential_expression/results/project1_DEGs_filtered.csv",
  row.names = FALSE
)
