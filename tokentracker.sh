#!/bin/bash

# Your CoinMarketCap API Key
API_KEY="Your-API-Key-Here"
COINS_FILE="coins.txt"
TEMP_FILE="prices.tmp"
HISTORY_FILE="history.txt"

# Initialize or clear the temporary file
> "$TEMP_FILE"

# Function to fetch and display prices and save to history
fetch_prices() {
    local coins=$(paste -sd "," "$COINS_FILE")
    local response=$(curl -s -H "X-CMC_PRO_API_KEY: $API_KEY" -H "Accept: application/json" \
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=${coins}&convert=USD")

    local timestamp=$(date "+%d/%m/%Y | %H:%M")

    # Extract each coin's price and check if it’s valid
    for coin in $(cat "$COINS_FILE"); do
        local price=$(echo "$response" | jq -r ".data[\"${coin}\"].quote.USD.price")

        if [ "$price" == "null" ] || [ -z "$price" ]; then
            output="${timestamp} | \$${coin}/USD: Error retrieving price"
            printf "%s\n" "$output"
            echo "$output" >> "$HISTORY_FILE"
            continue
        fi

        # Format price output based on magnitude for display
        if (( $(echo "$price >= 1" | awk '{print ($1 >= 1)}') )); then
            formatted_price=$(printf "%.2f" "$price")
        else
            formatted_price=$(printf "%.10f" "$price")
        fi

        # Print and save output to history
        output="${timestamp} | \$${coin}/USD: ${formatted_price}$"
        printf "%s\n" "$output"
        echo "$output" >> "$HISTORY_FILE"

        # Update the temporary file with the current price
        sed -i "/^${coin} /d" "$TEMP_FILE"
        echo "$coin $price" >> "$TEMP_FILE"
    done
    echo "" >> "$HISTORY_FILE"  # Add a blank line between each timestamp block
}

# Loop to fetch prices every minute
while true; do
    fetch_prices
    echo "Prices loaded, expect auto-pdate after every 60 seconds!"
    sleep 60
done
