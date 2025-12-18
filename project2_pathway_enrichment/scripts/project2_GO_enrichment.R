############################################################
# Project 2: GO Biological Process enrichment analysis
# Input: Differentially expressed gene list from Project 1
# Purpose: Identify biological processes enriched in ILD
############################################################

## ---------------------------
## 1. Load required libraries
## ---------------------------

library(clusterProfiler)
library(org.Hs.eg.db)
library(dplyr)
library(readr)

## ---------------------------
## 2. Read Project 1 gene list
## ---------------------------

# This path is relative to this script's location:
# project2_pathway_enrichment/scripts/project2_GO_enrichment.R

deg <- read_csv(
  "../../project1_differential_expression/results/project1_DEGs_filtered.csv"
)

# Expecting at minimum:
# GENE_SYMBOL, logFC, adj.P.Val

## ---------------------------
## 3. Map gene symbols to Entrez IDs
## ---------------------------

# GO enrichment requires Entrez IDs, not gene symbols
entrez_ids <- bitr(
  deg$GENE_SYMBOL,
  fromType = "SYMBOL",
  toType   = "ENTREZID",
  OrgDb    = org.Hs.eg.db
)

# Remove unmapped genes
entrez_ids <- entrez_ids[!is.na(entrez_ids$ENTREZID), ]

## ---------------------------
## 4. GO Biological Process enrichment
## ---------------------------

ego_bp <- enrichGO(
  gene          = entrez_ids$ENTREZID,
  OrgDb         = org.Hs.eg.db,
  keyType       = "ENTREZID",
  ont           = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff  = 0.05,
  qvalueCutoff  = 0.05,
  readable      = TRUE
)

## ---------------------------
## 5. Save enrichment results
## ---------------------------

# Convert to data frame for inspection and reuse
go_results <- as.data.frame(ego_bp)

# Save results for reporting and downstream interpretation
write.csv(
  go_results,
  "../results/project2_GO_BP_enrichment.csv",
  row.names = FALSE
)

## ---------------------------
## 6. Save visualization
## ---------------------------

pdf("../results/project2_GO_BP_dotplot.pdf", width = 8, height = 6)

dotplot(
  ego_bp,
  showCategory = 12,
  title = "GO Biological Process enrichment in ILD"
)

dev.off()

## ---------------------------
## 7. Sanity checks (optional)
## ---------------------------

cat("Number of DEGs used:", nrow(entrez_ids), "\n")
cat("Number of enriched GO terms:", nrow(go_results), "\n")