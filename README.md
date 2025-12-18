# Open-data transcriptomic analysis of interstitial lung disease (ILD)
## Overview

This repository contains two linked self-directed bioinformatics projects using public human lung transcriptomic data to explore molecular changes associated with interstitial lung disease (ILD). Together, the projects demonstrate a structured progression from gene-level statistical analysis to pathway-level biological interpretation.

## Dataset

Source: Gene Expression Omnibus (GEO)

Accession: GSE47460

Platform: GPL14550

Tissue: Human lung tissue

Groups: ILD and healthy controls

## Project structure
├── project1_DEG_analysis/
│   ├── scripts/
│   ├── results/
│   └── README.md
│
├── project2_pathway_enrichment/
│   ├── scripts/
│   ├── results/
│   └── README.md

## Project 1: Differential gene expression analysis

Identifies genes differentially expressed between ILD and healthy lung tissue using the limma framework. Emphasis is placed on careful data handling, statistical reasoning, and visualization of gene-level expression changes.

## Project 2: Pathway-level interpretation

Builds on Project 1 by applying Gene Ontology Biological Process enrichment analysis to the final gene list. This project focuses on contextualizing gene-level changes in terms of immune, inflammatory, and tissue remodeling processes relevant to ILD pathology.

## Learning focus

These projects were completed as part of a structured progression from hands-on gene-level statistical analysis to pathway-level biological interpretation using open human disease datasets.
