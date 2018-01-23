# set timezone
Sys.setenv(TZ='America/New_York')

#required packages
library(jsonlite)
library(httr)
library(zoo)
library(R.utils)
library(devtools)
library(digest)
library(snakecase)
library(futile.logger)
library(data.table)
library(binancer)

# set working directories
setwd("~/rProgramming/Trading/crypto/")
rootdir <- "~/rProgramming/Trading/crypto/"
datadir <- "~/rProgramming/Trading/crypto/stockdata/"
functiondir <- "~/rProgramming/Trading/crypto/functions/"


# Binance keys
binance_credentials(binance_key, binance_secret)

# create a DATA list
DATA <- list()

#Set list of stocks
## a list of stocks
#S <- c("ARKBTC", "ETHBTC", "NEOETH")
## all stocks
S <- binance_symbols()

# Create a list of stocks
setwd(rootdir)
dump(list = "S", "S.R")

#load new column names
column_names <- c("open_time", "open", "high", "low", "close", "volume", "close_time",
                  "quote_asset_volume", "trades", "taker_buy_base_asset_volume",
                  "taker_buyer_quote_volume", "symbol")

# create the list of toload symbols
toload <- S

# source functions
setwd(functiondir)
files.sources = list.files()
sapply(files.sources, source)

# write csv files from get_klines
setwd(datadir)
if(length(toload) != 0){
        for(i in 1:length(toload)){

                df <- get_klines(toload[i], interval = "4h", limit = 1080)

                if(!is.null(df)) {
                        #changing names
                        colnames(df) <- column_names
                        # as zoo objects downloaded, row names must be TRUE. Use write ZOO
                        # write.zoo(df, file = "AADABTC.csv", sep = ",")
                        write.csv(df, file = paste0(toload[i], ".csv"), sep ="," ,row.names = FALSE)
                } else {
                        invalid <- c(invalid, toload[i])
                }

        }
}

# create invalid.R file
setwd(rootdir)
dump(list = c("invalid"), "invalid.R")

# Clears R environment except for path variables and functions
#rm( list = setdiff( ls(), c(" rootdir", "functiondir", "datadir", "quandl_get", "column_names")))
#gc()

#### 2.5
# read all files in data dir to create S
setwd(datadir)
S <- sub(".csv", "", list.files())

require(data.table)

# create DATA
DATA <- list()
for(i in S){
        suppressWarnings(
                # read as Zoo instead of fread
                # DATA[[i]] <- fread(paste0(i, ".csv"), sep = ","))
                DATA[[i]] <- read.zoo(paste0(i, ".csv"), index = 1, header = TRUE, sep = ",", tz = "")
        )
        # sort by index
        DATA[[i]] <- zoo(DATA[[i]], order.by = index(DATA[[i]]))
}


#### read after loading first time
setwd(datadir)
S <- sub(".csv", "", list.files())

require(data.table)

DATA <- list()
for(i in S){
        suppressWarnings(
                DATA[[i]] <- read.zoo(paste0(i, ".csv"), index = 1, header = TRUE, sep = ",", tz = "")
        )
        DATA[[i]] <- zoo(DATA[[i]], order.by = index(DATA[[i]]))
}

# 2.6
## get current time
currentTime <- Sys.time()

### get the max date
maxdate <- end(DATA[[i]])

## help function hours
hours <- function(u) {
        x <- u * 3600
        return(x)
}

# if maxdate is greater than 4 hours from now, call function again
if(as.numeric(difftime(currentTime, maxdate, units = "hours")) >= 4) {
        maxdate <- maxdate + hours(4)
}
