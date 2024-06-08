## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

- 
```shell
forge script script/DeployGTD.sol:DeployGTDScript --rpc-url http://127.0.0.1:8545 --private-key 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a --broadcast
```

### Cast

```shell
$ cast <subcommand>
```

### create wallet

```shell
cast wallet new
```

### show balance

```shell
cast call 0x5c897F49CacE5DA23880a4f7AB18Aab0E9d69b25 "balanceOf(address)" 0x663F3ad617193148711d28f5334eE4Ed07016602 --rpc-url http://localhost:8545
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
