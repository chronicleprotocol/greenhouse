# Greenhouse • [![Unit Tests](https://github.com/chronicleprotocol/greenhouse/actions/workflows/unit-tests.yml/badge.svg)](https://github.com/chronicleprotocol/greenhouse/actions/workflows/unit-tests.yml) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

The `Greenhouse` contract provides a contract factory with deterministic addresses solely depending on a given salt.

To remove a contract's initcode factor from the address generation, `Greenhouse` uses [CREATE3](./src/libs/LibCREATE3.sol).

The contract uses [`chronicle-std/Auth`](https://github.com/chronicleprotocol/chronicle-std)'s `Auth` module to grant addresses access to protected functions. [`chronicle-std`](https://github.com/chronicleprotocol/chronicle-std)'s `Toll` module is utilized to determine which addresses are eligible to plant new contracts.

## Installation

Install module via Foundry:

```bash
$ forge install chronicleprotocol/greenhouse@v1
```

## Contributing

The project uses the Foundry toolchain. You can find installation instructions [here](https://getfoundry.sh/).

Setup:

```bash
$ git clone https://github.com/chronicleprotocol/greenhouse
$ cd greenhouse
$ forge install
```

Run tests:

```bash
$ forge test
$ forge test -vvvv # Run with full stack traces
$ FOUNDRY_PROFILE=intense forge test # Run in intense mode
```

Lint:

```bash
$ forge fmt [--check]
```

Update gas snapshots:

```bash
$ forge snapshot [--check]
```

## Dependencies

- [chronicleprotocol/chronicle-std@v2](https://github.com/chronicleprotocol/chronicle-std/tree/v2)
