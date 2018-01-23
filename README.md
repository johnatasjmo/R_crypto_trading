# R Crypto Trading

The purpose of this project is to get data from cryptocurrency exchanges, backtest strategies and place trades.

Exchanges available: Binance

This repo is to be used only for learning purposes of how to handle data and trading strategies, not suitable for trading.

## Inspiration

Sources if Inspiration

how to get data, read and process backtest
https://github.com/chrisconlan/automated_trading_with_R

Binance stock prices api
https://github.com/GinzaLion/R-Cryptocurrencies
https://github.com/daroczig/binancer

## Prerequisites

* Install RStudio
* Get Binance API credentials
* Install packages
* Create folders for first time

### Preparation
* Set timezone
* Install packages
* Validate your credentials

## Folder structure
`functions` folder contains all functions to be used
`stockdata` folder contains  `.csv` files pulled from Exchanges
`workflow` folder contains R scripts for each phase
`scratch` folder has draft code as inspiration

## Workflow

### Collect data workflow
*First time*
* Download currency prices
* Save currency prices into stockdata folder as csv

*On going*
* Read downloaded data in stockdata folder
* Download new currency prices and update csv files
* Check data is sorted and unique

### Backtesting
*Set strategies*
* Select an strategy
* Select start and end date
* Run scenarios
* Compare shape ratio

## Contributing

Slack channel:

## Licence
