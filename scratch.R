
# install binancer from github if not installed
 install_github("daroczig/binancer")

# set working directory
setwd("~/rProgramming/Trading/crypto/")

# set timezone
Sys.setenv(TZ='America/New_York')
Sys.setenv(TZ="UCT")

# source all files in binancer/R
setwd("~/rProgramming/Trading/crypto/binancer/R")
files.sources = list.files()
sapply(files.sources, source)
setwd("~/rProgramming/Trading/crypto/")

# check all functions inside the package
lsf.str("package:binancer")

## symbols
"NEOBTC"

# test jmo balances
jmo_balances <- binance_balances()

# get_klines
binance_ticker_all_prices()
binance_symbols()
binance_coins()
binance_coins_prices()

#klines
prices_OMG <- get_klines("ETHUSDT", "1h", limit = 50)

# new dataframe
price.LTC <- get_klines(c("LTCBTC"), "1d", limit = 200)
df_columns <- c("open_time", "open", "close")
price_LTC.df <- df[,c("open_time", "open")]

# create a dataframe of symbols
df <- list("ETHBTC", "ETHBTC", "NEOETH")
# import data from binance
df <- lapply(df, get_klines, interval = "4h", limit = 50)

# test write zoo
## write zoo separated with comma
write.csv(df, file = "AADABTC.csv", sep = "," , row.names = FALSE)
## read zoo file as csv
# Tread.csv.zoo <- read.csv.zoo(file = "AADABTC.csv", index = 1)
Tread.zoo <- read.zoo(file = "AADABTC.csv", index = 1, header = TRUE, sep = ",", tz = "")
DATA[[i]] <- read.zoo(paste0(i, ".csv"), header = TRUE, index = 1, tz = "")




