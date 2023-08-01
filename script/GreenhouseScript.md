# Greenhouse Script

This document describes how to deploy and manage `Greenhouse` instances via the `Greenhouse.s.sol`'s `GreenhouseScript`.

The following environment variables are necessary for all commands:

- `RPC_URL`: The RPC URL of an EVM node
- `PRIVATE_KEY`: The private key to use

Note that foundry offers different wallet options, for more info see `$ forge script -h`.

## Deployment

Set the following environment variables:
- `ETHERSCAN_API_KEY`: The Etherscan API key for the Etherscan's chain instance
- `INITIAL_AUTHED`: The address being auth'ed on the newly deployed `Greenhouse` instance

Run:
```bash
$ forge script \
    --private-key $PRIVATE_KEY \
    --broadcast \
    --rpc-url $RPC_URL \
    --etherscan-api-key $ETHERSCAN_API_KEY \
    --verify \
    --sig $(cast calldata "deploy(address)" $INITIAL_AUTHED) \
    -vvv \
    script/Greenhouse.s.sol:GreenhouseScript
```


## Management

The following environment variables are necessary for all management commands:
- `GREENHOUSE`: The `Greenhouse` instance's address

### `IAuth::rely`

Set the following environment variables:
- `WHO`: The address to grant auth to

Run:
```bash
$ forge script \
    --private-key $PRIVATE_KEY \
    --broadcast \
    --rpc-url $RPC_URL \
    --sig $(cast calldata "rely(address,address)" $GREENHOUSE $WHO) \
    -vvv \
    script/Greenhouse.s.sol:GreenhouseScript
```

### `IAuth::deny`

Set the following environment variables:
- `WHO`: The address renounce auth from

Run:
```bash
$ forge script \
    --private-key $PRIVATE_KEY \
    --broadcast \
    --rpc-url $RPC_URL \
    --sig $(cast calldata "deny(address,address)" $GREENHOUSE $WHO) \
    -vvv \
    script/Greenhouse.s.sol:GreenhouseScript
```

### `IToll::kiss`

Set the following environment variables:
- `WHO`: The address grant toll to

Run:
```bash
$ forge script \
    --private-key $PRIVATE_KEY \
    --broadcast \
    --rpc-url $RPC_URL \
    --sig $(cast calldata "kiss(address,address)" $GREENHOUSE $WHO) \
    -vvv \
    script/Greenhouse.s.sol:GreenhouseScript
```

### `IToll::diss`

Set the following environment variables:
- `WHO`: The address renounce toll from

Run:
```bash
$ forge script \
    --private-key $PRIVATE_KEY \
    --broadcast \
    --rpc-url $RPC_URL \
    --sig $(cast calldata "diss(address,address)" $GREENHOUSE $WHO) \
    -vvv \
    script/Greenhouse.s.sol:GreenhouseScript
```
