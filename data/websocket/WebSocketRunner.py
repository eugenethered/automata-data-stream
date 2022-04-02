import asyncio

from data.websocket.DataWebSocket import DataWebSocket


class WebSocketRunner:

    def __init__(self, url):
        self.web_socket = DataWebSocket(url)
        self.loop = asyncio.get_event_loop()

    def fetch_single_payload(self):
        return self.loop.run_until_complete(self.__receive_single_message())

    async def __receive_single_message(self):
        async with self.web_socket as ws:
            return await ws.receive()

    def receive_data(self):
        asyncio.run(self.__receive_data())

    async def __receive_data(self):
        async with self.web_socket as ws:
            async for message in ws:
                # todo: need to have a message processor here
                print(message)
