// Import the web3 library
import Web3 from "web3";

// Connect to the Ethereum network
const web3 = new Web3(new Web3.providers.HttpProvider("https://goerli.infura.io/v3/bfe04b4b76224d75828e2ea4383bce68"));

// The address of the deployed CoinFlip contract
const contractAddress = "0x24E37B13f245EC41856b236F689a27876CB19128";

// The ABI of the CoinFlip contract
const contractABI = [{[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[],"name":"deposit","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_guess","type":"uint256"}],"name":"flipCoin","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"internalType":"address","name":"_address","type":"address"}],"name":"getLosses","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_address","type":"address"}],"name":"getWins","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_amount","type":"uint256"}],"name":"withdraw","outputs":[],"stateMutability":"nonpayable","type":"function"}]}];

// Create a contract object
const coinFlip = new web3.eth.Contract(contractABI, contractAddress);

// Deposit 1 ETH
coinFlip.methods.deposit().send({from: "0x24E37B13f245EC41856b236F689a27876CB19128", value: web3.utils.toWei("1", "ether")})
    .then(console.log)
    .catch(console.error);

// Place a bet
coinFlip.methods.flipCoin(1).send({from: "0x24E37B13f245EC41856b236F689a27876CB19128", value: web3.utils.toWei("0.1", "ether")})
    .then(console.log)
    .catch(console.error);

// Get the user's win count
coinFlip.methods.getWins("0x24E37B13f245EC41856b236F689a27876CB19128").call()
    .then(console.log)
    .catch(console.error);
