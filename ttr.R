#load library
library("TTR")


prices_OMG <- get_klines("ETHUSDT", "4h", limit = 200)
prices_OMG_open <- prices_OMG$open
RSI(prices_OMG_open, n = 14)