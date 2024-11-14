# Crypto Tracker CLI

A simple Bash script that fetches and displays real-time cryptocurrency prices in the terminal. The script also logs price history to a file (`history.txt`) for tracking purposes.

## Features

- Fetches live cryptocurrency prices from CoinMarketCap's API. You need to apply for your own API via CoinMarketCap.
- Displays prices in the terminal with timestamps.
- Logs price history to `history.txt` for later reference.
- Customizable to track any list of cryptocurrencies.

## Requirements

- **Linux**: The script is designed to run in a Linux environment.
- **jq**: A lightweight JSON processor for parsing API responses.
- **CoinMarketCap API Key**: Required to fetch live cryptocurrency prices.

## Installation

1. **Clone the repository**:
    ```bash
   git clone https://github.com/SanWach/Tokentracker.git
   cd Tokentracker
2. **Install jq**:
    ```bash
   sudo apt-get install jq
3. **Sign up on CoinMarketCap to get your API - They provide a free tier**:

 - Sign up at CoinMarketCap and get a free API key from the Developer Portal.

 *Add your API Key*:

 - Open the script file (crypto_tracker.sh) in a text editor.
 - Replace "API" in API_KEY="API" with your actual API key.

## Usage

1. **List your currency**:
Simply put your desired coins in the coins.txt file. 

Example:

BTC
ETH

2. **Run the script**:
Run the script with:
    
./tokentracker.sh


## License

This project is open-source and available under the MIT License.

----

This `README.md` file provides clear instructions and usage details, making it easy for others to set up and use the script on their systems. Make sure to update the GitHub URL with your actual repository link.



