Function "targetApply" for anaylzing genes for targetability.

The function takes input of data frame with a mininum of one column with the name "H_Gene" which contains genes in HGNC format

The function will return this data frame with appended columns of whether the gene is targetable, the name of the drug that can target it and the id of that drug.

Must have Target_List.tsv pulled from GitHub. Target data is taken from the DGI database. Source: http://dgidb.org/downloads 

source targetApply.R to access the function

