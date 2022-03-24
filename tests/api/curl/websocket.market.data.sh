BINANCE_BASE_URL="wss://testnet.binance.vision"

echo -e "\nObtaining Exchange Market Data (testnet)\n"

URI="/stream?streams=!ticker@arr"
URL=${BINANCE_BASE_URL}${URI}

curl -i -N -H "Connection: Upgrade" -H "Upgrade: websocket" -H "Host: echo.websocket.org" -H "Origin: https://www.websocket.org" $URL

echo -e "\n\nURL: $URL\n"

# notes:
# CURL does not support "wss" protocol