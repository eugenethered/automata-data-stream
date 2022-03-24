#!/usr/bin/env python3

import asyncio
import signal
import websockets

async def market_data_stream():
  ws_base_url = 'wss://testnet.binance.vision/stream?streams='
  ws_stream = '!ticker@arr'
  ws_url = '%s%s' % (ws_base_url, ws_stream)
  async with websockets.connect(ws_url) as websocket:
    loop = asyncio.get_running_loop()
    loop.add_signal_handler(signal.SIGTERM, loop.create_task, websocket.close())
    async for message in websocket:
      print('message received! %s' % message)


asyncio.run(market_data_stream())
