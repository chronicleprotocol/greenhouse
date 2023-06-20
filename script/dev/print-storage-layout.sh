#!/bin/bash

# Script to print the storage layout of Greenhouse.
#
# Run via:
# ```bash
# $ script/dev/print-storage-layout.sh
# ```

echo "Greenhouse Storage Layout"
forge inspect src/Greenhouse.sol:Greenhouse storage --pretty
