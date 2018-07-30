Target_genes <<- read.csv("Target_List.tsv",sep="\t",stringsAsFactors = FALSE)

#Function
targetApply <- function(in) {
  in$Targetable <- FALSE
  in$Drug_name <- NA
  in$Drug_chembl_id <- NA

  return(as.data.frame(t(apply(in1,FUN=function(x) {
    if (x["H_Gene"] %in% Target_genes$Trgt_Genes) {
      x["Targetable"] <- TRUE

      index <- which(Target_genes$Trgt_Genes == x["H_Gene"])


      x["Drug_name"] <- Target_genes$Drug_name[index]

      x["Drug_chembl_id"] <- Target_genes$Drug_chembl_id[index]

    }
    return(x)
  },MARGIN = 1)))
 
}
