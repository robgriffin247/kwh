library(data.table)

dim_air_temperature <- 
  rbindlist(
    lapply(list.files('data', pattern='air_temperature'), function(file){ fread(paste0('data/', file)) })
  )

setnames(dim_air_temperature, c('date', 'time', 'air_temperature', 'quality'))

dim_air_temperature <- unique(dim_air_temperature[!is.na(air_temperature)])

dim_air_temperature[, date:=as.Date(date)]