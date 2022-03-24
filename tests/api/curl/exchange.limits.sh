BINANCE_BASE_URL="https://testnet.binance.vision"

echo -e "\nObtaining Exchange Information (limits)\n"

URI="/api/v3/exchangeInfo"
URL=${BINANCE_BASE_URL}${URI}

curl --silent -X GET $URL

echo -e "\n\nURL: $URL\n"
