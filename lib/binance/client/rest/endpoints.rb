
module Binance
  module Client
    class REST
      ENDPOINTS = {
        # Public API Endpoints
        # 独有的
        ping:              'v1/ping',
        time:              'v1/time',
        exchange_info:     'v1/exchangeInfo',
        trades:            'v1/trades',

        # 共有的
        depth:             'v1/depth',
        history_trade: 'v1/historicalTrades',
        day_trade:  'v1/ticker/24hr',
        klines:            'v1/klines',


        # agg_trades:        'v1/aggTrades',
        
        # price:             'v3/ticker/price',
        # book_ticker:       'v3/ticker/bookTicker',

        # # Account API Endpoints
        # order:            'v3/order',
        # test_order:       'v3/order/test',
        # open_orders:      'v3/openOrders',
        # all_orders:       'v3/allOrders',
        # account:          'v3/account',
        # my_trades:        'v3/myTrades',
        # user_data_stream: 'v1/userDataStream',

        # # Withdraw API Endpoints
        # withdraw:         'v3/withdraw.html',
        # deposit_history:  'v3/depositHistory.html',
        # withdraw_history: 'v3/withdrawHistory.html',
        # deposit_address:  'v3/depositAddress.html',
        # account_status:   'v3/accountStatus.html',
        # system_status:    'v3/systemStatus.html',
        # withdraw_fee:     'v3/withdrawFee.html'
      }.freeze
    end
  end
end
