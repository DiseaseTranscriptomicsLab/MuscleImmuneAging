
library(Seurat)

srt <- readRDS("/mnt/nmorais-nfs/marta/pB_joana/pC_data/srt-all-samples-after-qc.rds")

resolutions <- seq(0.3, 1, 0.1)
result <- list()

for (res in resolutions){
  print(res)
  Idents(srt) <- srt[[paste("RNA_snn_res.",res, sep ="")]]
  result[[paste("RNA_snn_res.",res, sep="")]] <- FindAllMarkers(srt, 
                                                                test.use = "MAST",
                                                                only.pos = FALSE,
                                                                logfc.threshold = -Inf,
                                                                random.seed = 1234)}

saveRDS(result, 
"/mnt/nmorais-nfs/marta/pB_joana/pC_data/dea-tables/all-samples-no-qc/all-samples-after-qc_res03-10.rds")















