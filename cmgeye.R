## ----start-----------------------------------------------------------------------------------------------
suppressPackageStartupMessages({
  library(AnVIL)
  library(DT)
  library(ggplot2)
  })
avworkspace("use-strides/CMG Eye")  # declares until reset
tabs = avtables()
tabs


## ----stab------------------------------------------------------------------------------------------------
subjtab = avtable("subject")
dim(subjtab)
names(subjtab)


## ----satab-----------------------------------------------------------------------------------------------
samptab = avtable("sample")
dim(samptab)
names(samptab)


## ----dodt------------------------------------------------------------------------------------------------
datatable(samptab)


## ----lkseq-----------------------------------------------------------------------------------------------
seqtab = avtable("sequencing")
datatable(seqtab)


## ----dohist----------------------------------------------------------------------------------------------
ggplot(seqtab, aes(x=`pfb:total_reads`)) + geom_histogram()


## ----filt------------------------------------------------------------------------------------------------
drs_pair = seqtab %>% filter(grepl("PIE_OGI001_000346_1", `pfb:seq_filename`)) %>%
    select(`pfb:ga4gh_drs_uri`) %>% as.data.frame
drs_pair[[1]]
gsu = drs_stat(drs_pair[[1]])$gsUri
gsu


## ----drscp-----------------------------------------------------------------------------------------------
drs_cp(drs_pair[[1]], ".")
dir(patt="cram")

