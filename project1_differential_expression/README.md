# Project 1: Differential gene expression analysis in interstitial lung disease (ILD)

## Background
Interstitial lung disease (ILD) is a chronic condition characterized by progressive
remodeling of lung tissue involving fibrotic and inflammatory processes. Studying gene
expression differences between diseased and healthy lung tissue can provide insight
into molecular changes related to fibrosis, inflammation, and loss of normal lung
function.

## Dataset
This project uses publicly available microarray data from the Gene Expression Omnibus (GEO):

- Accession: GSE47460  
- Platform: GPL14550  
- Tissue: Human lung tissue  

After subsetting, the analysis included **193 ILD samples** and **91 healthy control samples**.

## Analysis overview
This analysis was conducted in R as a self-directed learning project focused on
understanding transcriptomic data structure, statistical reasoning, and biological
interpretation.

Key steps included:
- Extracting expression matrices and sample metadata using GEOquery
- Subsetting samples to compare ILD and control groups
- Performing differential expression analysis using the limma framework
- Applying multiple-testing correction using false discovery rate (FDR)
- Visualizing results using a volcano plot and a heatmap of top differentially expressed genes

## Parameter choices
To focus on biologically interpretable changes while accounting for the heterogeneity
of human lung tissue, results were filtered using:
- **FDR < 0.05** to control for multiple testing
- **|logFC| > 0.25** as a moderate effect-size threshold, reflecting the expectation of
  subtle but consistent expression changes rather than large single-gene effects

Expression values were scaled by gene for heatmap visualization to emphasize relative
differences across samples rather than absolute expression levels.

## Key observations
Differential expression analysis identified widespread transcriptional changes between
ILD and control lung tissue, with both up- and down-regulated gene sets rather than a
unidirectional shift. This pattern is consistent with broad tissue remodeling in chronic
lung disease.

Genes associated with extracellular matrix remodeling and fibrosis, such as **MMP1**
and **MMP7**, were among the most strongly upregulated in ILD samples. In contrast,
genes associated with normal epithelial or structural lung function, such as **CA4**,
showed reduced expression, reflecting loss of normal tissue programs in diseased lung.

Together, the volcano plot and heatmap illustrate coordinated expression changes across
multiple genes, highlighting that ILD is characterized by broad molecular
reprogramming rather than isolated single-gene effects.

## Notes and reflections
A key challenge during this project was ensuring correct alignment between the expression
matrix and sample metadata. Resolving this issue highlighted the importance of preserving
sample identifiers and verifying sample ordering when working with public transcriptomic
datasets.

Overall, this project emphasized the importance of pathway-level interpretation over a
single-gene focus when analyzing heterogeneous human tissue data.

## Files

### Scripts
- `project1_ILD_limma_clean.R`  
  Differential expression analysis using limma

- `extract_project1_gene_list.R`  
  Extracts the final gene-level DEG list for downstream pathway analysis

### Results
- `project1_DEGs_filtered.csv`  
  Final gene-level list of differentially expressed genes (ILD vs control), filtered by
  adjusted p-value < 0.05 and effect size threshold.  
  This file is used as input for **Project 2 (pathway enrichment analysis)**.

### Figures
- `volcano_ILD_vs_Control.pdf`  
  Volcano plot visualising differential expression results

- `heatmap_top25_DEGs.pdf`  
  Heatmap of the top 25 differentially expressed genes across samples
