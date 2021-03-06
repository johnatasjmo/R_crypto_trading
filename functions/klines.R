#' Get kline/candlestick data
#' @param symbol string
#' @param interval enum
#' @param limit int
#' @return data.table
#' @export
#' @importFrom data.table rbindlist
#' @examples \dontrun{
#' get_klines('ETHUSDT')
#' }
get_klines <- function(symbol, interval, limit = 500) {

    #interval <- match.arg(interval)

    klines <- binance_query(
        endpoint = 'api/v1/klines',
        params   = list(symbol   = symbol,
                        interval = interval,
                        limit    = limit))

    klines <- rbindlist(klines)
    ## drop last dummy column
    klines <- klines[, -12]
    names(klines) <- c(
        'open_time',
        'open',
        'high',
        'low',
        'close',
        'volume',
        'close_time',
        'quote_asset_volume',
        'trades',
        'taker_buy_base_asset_volume',
        'taker_buy_quote_asset_volume')

    for (v in names(klines)) {
        klines[, (v) := as.numeric(get(v))]
    }

    for (v in c('open_time', 'close_time')) {
        klines[, (v) := as.POSIXct(get(v)/1e3, origin = '1970-01-01')]
    }

    ## return
    klines[, symbol := symbol]
    klines

}
