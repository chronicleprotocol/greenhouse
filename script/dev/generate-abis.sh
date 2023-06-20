#!/bin/bash

# Script to generate Greenhouse's ABI.
# Saves the ABIs in fresh abis/ directory.
#
# Run via:
# ```bash
# $ script/dev/generate-abis.sh
# ```

rm -rf abis/
mkdir abis

echo "Generating Greenhouse's ABI"
forge inspect src/Greenhouse.sol:Greenhouse abi > abis/Greenhouse.json
