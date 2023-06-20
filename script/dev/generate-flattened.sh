#!/bin/bash


# Script to generate Greenhouse's flattened contract.
# Saves the contract in fresh flattened/ directory.
#
# Run via:
# ```bash
# $ script/dev/generate-flattened.sh
# ```

rm -rf flattened/
mkdir flattened

echo "Generating flattened Greenhouse contract"
forge flatten src/Greenhouse.sol > flattened/Greenhouse.sol
