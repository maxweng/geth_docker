#!/bin/ash
addr="$(./bin/geth --password secret.txt account new | sed -e 's/[^{]*{\([^}]*\)}.*/\1/g')"
echo "New coinbase address: $addr"
./bin/geth --datadir ./data/ init genesis.json
./bin/geth --datadir ./data/ --rpc --rpcaddr 0.0.0.0 --rpccorsdomain '*' --rpcapi 'web3,eth,debug,net,ssh' --ipcpath /run/geth.ipc --mine --minerthreads 1 --etherbase $addr