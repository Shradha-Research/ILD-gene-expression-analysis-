# ============================================================
# Project 1: Differential Gene Expression Analysis
# Disease: Interstitial Lung Disease (ILD)
# Dataset: GSE47460 (GPL14550)
# Clean, reproducible limma workflow for Project 1
# ============================================================

# Set working directory (adjust if needed)
setwd("C:/Users/shrad/OneDrive/Desktop/Bioinformatics project/IPF/Data")

# Load libraries
library(GEOquery)
library(limma)
library(dplyr)

# ------------------------------------------------------------
# Load GEO dataset
# ------------------------------------------------------------
gse <- getGEO("GSE47460", GSEMatrix = TRUE, getGPL = FALSE)
eset <- gse[[1]]

expr  <- exprs(eset)
pheno <- pData(eset)

# ------------------------------------------------------------
# Subset ILD vs Control samples
# ------------------------------------------------------------
keep <- pheno$`disease state:ch1` %in% c("Control", "Interstitial lung disease")
expr_sub  <- expr[, keep]
pheno_sub <- pheno[keep, ]

group  <- factor(pheno_sub$`disease state:ch1`)
design <- model.matrix(~ group)

# ------------------------------------------------------------
# Differential expression analysis (limma)
# ------------------------------------------------------------
fit <- lmFit(expr_sub, design)
fit <- eBayes(fit)

results <- topTable(fit, coef = 2, number = Inf)

# ------------------------------------------------------------
# Probe-to-gene annotation
# ------------------------------------------------------------
gpl <- getGEO("GPL14550")
gpl_table <- Table(gpl)

annotation <- gpl_table[, c("ID", "GENE_SYMBOL")]
results$ProbeID <- rownames(results)

results_annot <- merge(
  results,
  annotation,
  by.x = "ProbeID",
  by.y = "ID",
  all.x = TRUE
)

# ------------------------------------------------------------
# Extract filtered DEG gene list (for Project 2)
# ------------------------------------------------------------
deg_filtered <- results_annot %>%
  filter(
    adj.P.Val < 0.05,
    abs(logFC) >= 1,
    GENE_SYMBOL != ""
  ) %>%
  distinct(GENE_SYMBOL, .keep_all = TRUE)

gene_list <- deg_filtered %>%
  select(GENE_SYMBOL, logFC, adj.P.Val)

# Create results directory if missing
if (!dir.exists("results")) {
  dir.create("results")
}

# Save gene list
write.csv(
  gene_list,
  "results/project1_DEGs_filtered.csv",
  row.names = FALSE
)

# Sanity check
nrow(gene_list)
head(gene_list)

