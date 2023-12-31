library(data.table)
library(readxl)

dim_kwh <- 
  rbindlist(
    lapply(list.files('data', pattern='kwh'), function(file){ read_xlsx(paste0('data/', file)) })
  )

setnames(dim_kwh, c('date', 'kwh', 'vf_temperature'))

dim_kwh <- unique(dim_kwh[!is.na(kwh) & kwh>0])

dim_kwh[, date:=as.Date(date, format='%Y-%m-%d')]