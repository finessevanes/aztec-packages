# Run locally from end-to-end folder while running anvil and sandbox with:
# PATH=$PATH:../node_modules/.bin ./src/guides/up_quick_start.sh

set -eux

# docs:start:declare-accounts
ALICE="0x0f394e8bd156e15153376a711e3054821c2a1c1047dcfb3745d636a57fb42ab1"
BOB="0x2b67f90f0044596190644ddafea4152de47bd4781559493860fa7358e19d090a"
ALICE_PRIVATE_KEY="0x2153536ff6628eee01cf4024889ff977a18d9fa61d0e414422f7681cf085c281"
# docs:end:declare-accounts

# docs:start:deploy
aztec-cli deploy \
  TokenContractArtifact \
  --salt 0 \
  --args $ALICE

aztec-cli check-deploy --contract-address 0x2f45f498b7912c779dde8e3594622e36d7908088b09e99ab91caaafb40d1f9ef

CONTRACT="0x2f45f498b7912c779dde8e3594622e36d7908088b09e99ab91caaafb40d1f9ef"
# docs:end:deploy

# docs:start:mint-private
SECRET="0x29bf6afaf29f61cbcf2a4fa7da97be481fb418dc08bdab5338839974beb7b49f"
SECRET_HASH="0x0921759afa747c9073f75df9688a17d271cef0d6ec51eacf70e112402c4db6cd"

MINT_PRIVATE_OUTPUT=$(aztec-cli send mint_private \
  --args 1000 $SECRET_HASH \
  --contract-artifact TokenContractArtifact \
  --contract-address $CONTRACT \
  --private-key $ALICE_PRIVATE_KEY)

MINT_PRIVATE_TX_HASH=$(echo "$MINT_PRIVATE_OUTPUT" | grep "Transaction hash:" | awk '{print $NF}')

aztec-cli add-note \
  $ALICE $CONTRACT 5 $MINT_PRIVATE_TX_HASH \
  --note 1000 $SECRET_HASH

aztec-cli send redeem_shield \
  --args $ALICE 1000 $SECRET \
  --contract-artifact TokenContractArtifact \
  --contract-address $CONTRACT \
  --private-key $ALICE_PRIVATE_KEY
# docs:end:mint-private

# docs:start:get-balance
aztec-cli call balance_of_private \
  --args $ALICE \
  --contract-artifact TokenContractArtifact \
  --contract-address $CONTRACT
# docs:end:get-balance

# docs:start:transfer
aztec-cli send transfer \
  --args $ALICE $BOB 500 0 \
  --contract-artifact TokenContractArtifact \
  --contract-address $CONTRACT \
  --private-key $ALICE_PRIVATE_KEY

aztec-cli call balance_of_private \
  --args $ALICE \
  --contract-artifact TokenContractArtifact \
  --contract-address $CONTRACT

aztec-cli call balance_of_private \
  --args $BOB \
  --contract-artifact TokenContractArtifact \
  --contract-address $CONTRACT
# docs:end:transfer

aztec-cli get-logs

# Test end result
BOB_BALANCE=$(aztec-cli call balance_of_private --args $BOB --contract-artifact TokenContractArtifact --contract-address $CONTRACT)
if ! echo $BOB_BALANCE | grep -q 500; then
  echo "Incorrect Bob balance after transaction (expected 500 but got $BOB_BALANCE)"
  exit 1
fi
