# binance trading API
# set timezone
Sys.setenv(TZ='America/New_York')

# load libraries
library(jsonlite)
library(httr)
library(zoo)

# set working directory
setwd("~/rProgramming/Trading/crypto/")

# source files
source("R-Cryptocurrencies/Binance_Beta.R")
source("R-Cryptocurrencies/CoinMarketCap_Final.R")


# Coinmarketcap
coinmarketcap_ticker(basecurrency = "bitcoin", pricecurrency = "usd", field = "all")
coinmarketcap_ticker(basecurrency = "bitcoin", pricecurrency = "usd", field = "percent_change_1h")
coinmarketcap_ticker(basecurrency = "bitcoin", pricecurrency = "usd", field = "percent_change_24h")

# coinmarketcap global
coinmarketcap_global(pricecurrency = "usd", field = "all", limit = 200)
allcoins <- coinmarketcap_global(pricecurrency = "usd", field = "all", limit = 2000)
ether <- coinmarketcap_ticker(basecurrency = "ethereum", pricecurrency = "usd", field = "all")
