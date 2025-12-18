Project 2: Pathway-level interpretation of interstitial lung disease (ILD)
Background

Interstitial lung disease (ILD) is associated with heterogeneous transcriptional changes reflecting immune activation, tissue injury, and progressive remodeling of lung tissue. While gene-level differential expression analysis identifies individual genes associated with disease, pathway-level interpretation helps contextualize these changes in terms of broader physiological processes relevant to ILD pathology.

Dataset

This project uses the same publicly available microarray dataset analysed in Project 1:

Source: Gene Expression Omnibus (GEO)

Accession: GSE47460

Platform: GPL14550

Tissue: Human lung tissue

The input for this project is the final list of differentially expressed genes derived from Project 1.

Analysis overview

This analysis was conducted in R as a follow-up self-directed learning project focused on extending gene-level differential expression results to pathway-level biological interpretation.

Key steps included

Importing the final differentially expressed gene list from Project 1

Mapping gene symbols to standardized Entrez Gene identifiers

Performing Gene Ontology (GO) Biological Process enrichment analysis

Correcting for multiple testing using false discovery rate (FDR)

Visualizing representative enriched biological processes using a dot plot

Parameter choices and analytical rationale

GO Biological Process enrichment was selected to focus on broad, physiology-relevant processes rather than specific signaling pathways. This approach is well suited to heterogeneous bulk lung tissue data, where coordinated changes across multiple cell types may be more informative than alterations in individual signaling cascades.

An over-representation analysis framework was used because it aligns naturally with a filtered differential expression gene list and is appropriate for an initial pathway-level learning project.

Key observations

GO enrichment analysis identified multiple biological processes over-represented among ILD-associated genes. Prominent themes included immune and inflammatory processes such as leukocyte migration and chemotaxis, alongside extracellular matrix organization, wound healing, and epithelial remodeling.

These patterns are consistent with known features of ILD biology, where immune cell recruitment and chronic tissue injury coexist with progressive fibrotic remodeling of lung tissue.

Notes and reflections

Of the 579 differentially expressed genes identified in Project 1, 517 could be successfully mapped to standardized Entrez Gene identifiers for enrichment analysis. Some loss of genes during this step is expected and reflects limitations of gene annotation coverage. In addition, Gene Ontology terms are partially redundant and overlapping, requiring interpretation at the level of broader biological themes rather than individual terms.

Compared with Project 1, which focused on identifying statistically significant gene-level changes, this analysis helped clarify how many of those changes converge on a smaller number of recurring immune and tissue-remodeling processes relevant to ILD.

Files

Scripts

project2_GO_enrichment.R
Performs GO Biological Process enrichment analysis using the gene list derived from Project 1

Results

GO_BP_enrichment_results.csv
Full table of enriched GO Biological Processes

GO_BP_dotplot.pdf
Visualization of representative enriched biological processes
