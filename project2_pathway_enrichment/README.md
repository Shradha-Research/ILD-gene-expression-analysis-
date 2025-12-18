# Project 2: Pathway-level interpretation of ILD gene expression

## Background
Interstitial lung disease (ILD) is associated with heterogeneous transcriptional changes reflecting immune activation, tissue injury, and progressive remodeling of lung tissue. While differential expression analysis identifies individual genes associated with disease, interpreting how these genes relate to broader biological processes is necessary to connect transcriptomic results to disease physiology.

## Objective
To explore which biological processes are over-represented among genes differentially expressed in ILD compared with healthy lung tissue, as a first step toward pathway-level interpretation of human transcriptomic data.

## Input data
This analysis uses the final list of differentially expressed genes generated in Project 1:
- Dataset: GEO GSE47460 (GPL14550)
- Input genes: 579 genes filtered by adjusted p-value < 0.05 and effect size threshold
- 517 genes successfully mapped to Entrez Gene IDs and used for enrichment analysis

## Rationale for pathway analysis approach
Gene Ontology (GO) Biological Process enrichment was selected to focus on broad, physiology-relevant processes rather than specific signaling pathways. This approach is well suited to heterogeneous bulk lung tissue data, where coordinated changes across cell types may be more informative than alterations in individual signaling cascades. An over-representation analysis framework was used because it aligns naturally with a filtered differential expression gene list and is appropriate for an initial pathway-level learning project.

## Methods
GO Biological Process enrichment analysis was performed using the `clusterProfiler` package in R. Enrichment was assessed using the hypergeometric testing framework implemented in the software to evaluate whether genes associated with predefined biological processes were over-represented among ILD-associated genes relative to the background of measured genes. Multiple testing correction was applied using the Benjamini–Hochberg false discovery rate (FDR).

## Results
GO enrichment analysis identified multiple biological processes enriched among ILD-associated genes. Prominent themes included immune and inflammatory processes such as leukocyte migration and chemotaxis, alongside extracellular matrix organization, wound healing, and epithelial remodeling. Together, these processes reflect known features of ILD pathology, where immune cell recruitment and chronic tissue injury coexist with progressive fibrotic remodeling.

## Outputs
- `GO_BP_enrichment_results.csv`: Complete table of enriched GO Biological Processes, enabling further inspection of pathway-level patterns.
- `GO_BP_dotplot.pdf`: Visualization of representative enriched biological processes, summarizing dominant immune and remodeling-related themes in ILD.

## Limitations
Not all differentially expressed genes could be mapped to standardized gene identifiers, resulting in some loss of input genes during enrichment analysis. In addition, GO terms are partially redundant and overlapping, which necessitates cautious interpretation at the level of biological themes rather than individual terms.

## Interpretation and reflection
This project highlighted how gene-level differential expression results can be organized into higher-level biological patterns. Moving from individual genes to pathway-level enrichment helped clarify how diverse transcriptional changes in ILD reflect a smaller number of recurring physiological processes, rather than isolated molecular effects.

