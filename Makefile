-include .env

.PHONY: all test deploy

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

help:
	@echo "Usage:"
	@echo "make deploy [Args=...]"

build:
	forge build

install:
	forge install chainaccelorg/foundry-devops@0.0.11 --no-commit
	forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit && forge install foundry-rs/forge-std@1.5.3 --no-commit
	forge install transmissions11/solmate@v6 --no-commit

test:; forge test

anvil:; anvil -m "test test test test test test test test test test test junk" --steps-tracing --block-time 1

NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

ifeq ($(findstring --network sepolia,$(ARGS)), --network sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

deploy:
	@forge script script/DeployRaffle.s.sol:DeployRaffle $(NETWORK_URL)