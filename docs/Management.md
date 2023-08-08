# Management

This document describes how to manage deployed `Greenhouse` instances.

## Table of Contents

- [Management](#management)
  - [Table of Contents](#table-of-contents)
  - [Environment Variables](#environment-variables)
  - [Functions](#functions)
    - [`IAuth::rely`](#iauthrely)
    - [`IAuth::deny`](#iauthdeny)
    - [`IToll::kiss`](#itollkiss)
    - [`IToll::diss`](#itolldiss)

## Environment Variables

The following environment variables must be set for all commands:

- `RPC_URL`: The RPC URL of an EVM node
- `PRIVATE_KEY`: The private key to use
- `GREENHOUSE`: The `Greenhouse` instance to manage

Note that an `.env.example` file is provided in the project root. To set all environment variables at once, create a copy of the file and rename the copy to `.env`, adjust the variable's values', and run `source .env`.

## Functions

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
