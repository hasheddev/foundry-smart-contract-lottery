# Proveably Random Raffle contracts

## About
This is a random smart contract lottery
- Users can enter by paying for a ticket.
- After a time period with a spefic number of users already participating, the contract automatically selects a winner.
- Winner gets all the ticket fees.
- It uses ChainLink VRF for random winner selection.
- It uses Chainlink Automation for winner selecton.

### Requirements
- git
- foundry
- make

### Gettig started

``` shell
git clone https://github.com/kdshola/foundry-smart-contract-lottery.git
cd foundry-smart-contract-lottery
make install
forge build
```

#### Help text

``` shell
make help
```
#### Spin up anvil node

``` shell
make anvil
```

#### Deploy contract to test network
For anvil deployment no use `make deploy`

#### Environment variables
- PRIVATE_KEY
- ETHERSCAN_API_KEY
- SEPOLIA_RPC_URL

``` shell
make deploy ARGS="--network sepolia"
```

#### Test contract

``` shell
make test
```

