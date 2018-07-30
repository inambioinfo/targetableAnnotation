require(readxl)


Target_genes <<- read.csv("/home/nick/Desktop/Fusion_prioritization/payal_side/Target_List.tsv",sep="\t",stringsAsFactors = FALSE)
in1 <- read_excel("/home/nick/Desktop/Fusion_prioritization/payal_side/excel1")
in2 <- read_excel("/home/nick/Desktop/Fusion_prioritization/payal_side/excel2")

#Cleaning
in1 <- data.frame(gene = c(in1$`P-05_cell-line`,in1$`P-07_cell-line`,in1$`P-16_cell-line`))
in1 <- data.frame(H_Gene = in1[!is.na(in1),])

in1$Targetable <- FALSE
in1$Drug_name <- NA
in1$Drug_chembl_id <- NA

in2$Targetable <- FALSE
in2$Drug_name <- NA
in2$Drug_chembl_id <- NA
colnames(in2)[2] <- "H_Gene"

#Function
targetApply <- function(x) {
  if (x["H_Gene"] %in% Target_genes$Trgt_Genes) {
    x["Targetable"] <- TRUE
    
    index <- which(Target_genes$Trgt_Genes == x["H_Gene"])
    
    
    x["Drug_name"] <- Target_genes$Drug_name[index]
    
    x["Drug_chembl_id"] <- Target_genes$Drug_chembl_id[index]
    
  }
  return(x) 
}

in1 <- as.data.frame(t(apply(in1,FUN=targetApply,MARGIN = 1)))
in2 <- as.data.frame(t(apply(in2,FUN=targetApply,MARGIN = 1)))

write.table(in1,"/home/nick/Desktop/Fusion_prioritization/payal_side/output1.tsv",sep="\t")
write.table(in2,"/home/nick/Desktop/Fusion_prioritization/payal_side/output2.tsv",sep="\t")
