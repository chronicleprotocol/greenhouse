# Deployment

This document describes how to deploy a new `Greenhouse` instance.

## Environment Variables

The following environment variables must be set:

- `RPC_URL`: The RPC URL of an EVM node
- `PRIVATE_KEY`: The private key to use
- `ETHERSCAN_API_URL`: The Etherscan API URL for the Etherscan's chain instance
    - Note that the API endpoint varies per Etherscan chain instance
    - Note to point to actual API endpoint (e.g. `/api`) and not just host
- `ETHERSCAN_API_KEY`: The Etherscan API key for the Etherscan's chain instance
- `INITIAL_AUTHED`: The address being auth'ed on the newly deployed `Greenhouse` instance

Note that an `.env.example` file is provided in the project root. To set all environment variables at once, create a copy of the file and rename the copy to `.env`, adjust the variable's values', and run `source .env`.

## Execution

Run:

```bash
$ forge script \
    --private-key "$PRIVATE_KEY" \
    --broadcast \
    --rpc-url "$RPC_URL" \
    --verifier-url "$ETHERSCAN_API_URL" \
    --etherscan-api-key "$ETHERSCAN_API_KEY" \
    --verify \
    --sig $(cast calldata "deploy(address)" "$INITIAL_AUTHED") \
    -vvv \
    script/Greenhouse.s.sol:GreenhouseScript
```
