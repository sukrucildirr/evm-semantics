requires "../verification.k"

module TRANSFERFROM-SUCCESS-1-SPEC
  imports VERIFICATION

  // transferFrom-success-1
  claim
    <kevm>
    <k> #execute => #halt </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> CONSTANTINOPLE </schedule>
    <useGas> true </useGas>

    <ethereum>
      <evm>
        <output> _ => #buf(32, 1) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => ?_ </touchedAccounts>

        <callState>
          <program> #parseByteStack("0x60606040526004361061006d576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063095ea7b31461007257806323b872dd146100cc57806370a0823114610145578063a9059cbb14610192578063dd62ed3e146101ec575b600080fd5b341561007d57600080fd5b6100b2600480803573ffffffffffffffffffffffffffffffffffffffff16906020019091908035906020019091905050610258565b604051808215151515815260200191505060405180910390f35b34156100d757600080fd5b61012b600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061034a565b604051808215151515815260200191505060405180910390f35b341561015057600080fd5b61017c600480803573ffffffffffffffffffffffffffffffffffffffff169060200190919050506105c6565b6040518082815260200191505060405180910390f35b341561019d57600080fd5b6101d2600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061060f565b604051808215151515815260200191505060405180910390f35b34156101f757600080fd5b610242600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff16906020019091905050610778565b6040518082815260200191505060405180910390f35b600081600260003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925846040518082815260200191505060405180910390a36001905092915050565b600081600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410158015610417575081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410155b80156104235750600082115b156105ba5781600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254019250508190555081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825403925050819055508273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a3600190506105bf565b600090505b9392505050565b6000600160008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b600081600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054101580156106605750600082115b1561076d5781600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825401925050819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a360019050610772565b600090505b92915050565b6000600260008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050929150505600a165627a7a723058206cb5284e8795f7d1c570318732bc1cb8add2222946156c0ba28c946531c4a2f50029") </program>
          <jumpDests> #computeValidJumpDests(#parseByteStack("0x60606040526004361061006d576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063095ea7b31461007257806323b872dd146100cc57806370a0823114610145578063a9059cbb14610192578063dd62ed3e146101ec575b600080fd5b341561007d57600080fd5b6100b2600480803573ffffffffffffffffffffffffffffffffffffffff16906020019091908035906020019091905050610258565b604051808215151515815260200191505060405180910390f35b34156100d757600080fd5b61012b600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061034a565b604051808215151515815260200191505060405180910390f35b341561015057600080fd5b61017c600480803573ffffffffffffffffffffffffffffffffffffffff169060200190919050506105c6565b6040518082815260200191505060405180910390f35b341561019d57600080fd5b6101d2600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061060f565b604051808215151515815260200191505060405180910390f35b34156101f757600080fd5b610242600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff16906020019091905050610778565b6040518082815260200191505060405180910390f35b600081600260003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925846040518082815260200191505060405180910390a36001905092915050565b600081600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410158015610417575081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410155b80156104235750600082115b156105ba5781600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254019250508190555081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825403925050819055508273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a3600190506105bf565b600090505b9392505050565b6000600160008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b600081600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054101580156106605750600082115b1561076d5781600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825401925050819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a360019050610772565b600090505b92915050565b6000600260008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050929150505600a165627a7a723058206cb5284e8795f7d1c570318732bc1cb8add2222946156c0ba28c946531c4a2f50029")) </jumpDests>

          <id> ACCT_ID </id> // contract owner
          <caller> CALLER_ID </caller> // who called this contract; in the begining, origin // msg.sender

          <callData> #abiCallData("transferFrom", #address(FROM_ID), #address(TO_ID), #uint256(VALUE)) </callData>

          <callValue> 0 </callValue>
          <wordStack> .WordStack => ?_ </wordStack>
          <localMem> .Bytes => ?_ </localMem>
          <pc> 0 => ?_ </pc>
          <gas> #gas(_VGAS) => ?_ </gas>
          <memoryUsed> 0 => ?_ </memoryUsed>
          <callGas> _ => ?_ </callGas>

          <static> false </static> // NOTE: non-static call
          <callDepth> CALL_DEPTH </callDepth>
        </callState>
        <versionedHashes> _ </versionedHashes>

        <substate>
          <selfDestruct> _ </selfDestruct>
          <log> _:List ( .List => ListItem(#abiEventLog(ACCT_ID, "Transfer", #indexed(#address(FROM_ID)), #indexed(#address(TO_ID)), #uint256(VALUE))) ) </log>
          <refund> _ => ?_ </refund> // TODO: more detail
          <accessedAccounts> _ => ?_ </accessedAccounts>
          <accessedStorage> _ => ?_ </accessedStorage>
          <createdAccounts> _ => ?_ </createdAccounts>
        </substate>

        <gasPrice> _ </gasPrice>
        <origin> ORIGIN_ID </origin> // who fires tx

        <blockhashes> _ </blockhashes>
        <block>
          <previousHash> _ </previousHash>
          <ommersHash> _ </ommersHash>
          <coinbase> _ </coinbase>
          <stateRoot> _ </stateRoot>
          <transactionsRoot> _ </transactionsRoot>
          <receiptsRoot> _ </receiptsRoot>
          <logsBloom> _ </logsBloom>
          <difficulty> _ </difficulty>
          <number> _ </number>
          <gasLimit> _ </gasLimit>
          <gasUsed> _ </gasUsed>
          <timestamp> _ </timestamp>
          <extraData> _ </extraData>
          <mixHash> _ </mixHash>
          <blockNonce> _ </blockNonce>
          <baseFee> _ </baseFee>
          <ommerBlockHeaders> _ </ommerBlockHeaders>
          <withdrawalsRoot> _ </withdrawalsRoot>
          <blobGasUsed> _ </blobGasUsed>
          <excessBlobGas> _ </excessBlobGas>
          ...
        </block>
        ...
      </evm>

      <network>
        <chainID> _ </chainID>

        <accounts>
          <account>
            <acctID> ACCT_ID </acctID>
            <balance> _ </balance>
            <code> #parseByteStack("0x60606040526004361061006d576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063095ea7b31461007257806323b872dd146100cc57806370a0823114610145578063a9059cbb14610192578063dd62ed3e146101ec575b600080fd5b341561007d57600080fd5b6100b2600480803573ffffffffffffffffffffffffffffffffffffffff16906020019091908035906020019091905050610258565b604051808215151515815260200191505060405180910390f35b34156100d757600080fd5b61012b600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061034a565b604051808215151515815260200191505060405180910390f35b341561015057600080fd5b61017c600480803573ffffffffffffffffffffffffffffffffffffffff169060200190919050506105c6565b6040518082815260200191505060405180910390f35b341561019d57600080fd5b6101d2600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061060f565b604051808215151515815260200191505060405180910390f35b34156101f757600080fd5b610242600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803573ffffffffffffffffffffffffffffffffffffffff16906020019091905050610778565b6040518082815260200191505060405180910390f35b600081600260003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925846040518082815260200191505060405180910390a36001905092915050565b600081600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410158015610417575081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410155b80156104235750600082115b156105ba5781600160008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254019250508190555081600260008673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825403925050819055508273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a3600190506105bf565b600090505b9392505050565b6000600160008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050919050565b600081600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002054101580156106605750600082115b1561076d5781600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555081600160008573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825401925050819055508273ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff167fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef846040518082815260200191505060405180910390a360019050610772565b600090505b92915050565b6000600260008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060008373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050929150505600a165627a7a723058206cb5284e8795f7d1c570318732bc1cb8add2222946156c0ba28c946531c4a2f50029") </code>
            <storage> #hashedLocation("Solidity", 1,   FROM_ID)           |-> (BAL_FROM => BAL_FROM -Int VALUE)
#hashedLocation("Solidity", 1,   TO_ID)             |-> (BAL_TO   => BAL_TO  +Word VALUE)
#hashedLocation("Solidity", 2, FROM_ID CALLER_ID) |-> (ALLOW    => ALLOW    -Int VALUE)
_:Map </storage>
            <origStorage> #hashedLocation("Solidity", 1,   FROM_ID)           |-> BAL_FROM
#hashedLocation("Solidity", 1,   TO_ID)             |-> BAL_TO
#hashedLocation("Solidity", 2, FROM_ID CALLER_ID) |-> ALLOW
_:Map </origStorage>
            <nonce> _ </nonce>
            <transientStorage> _ </transientStorage>
          </account>
       // ... // TODO: fix
        </accounts>

        <txOrder> _ </txOrder>
        <txPending> _ </txPending>
        <messages> _ </messages>
        ...
      </network>
    </ethereum>
    </kevm>
    requires 0 <=Int ACCT_ID    andBool ACCT_ID    <Int (2 ^Int 160)
     andBool 0 <=Int CALLER_ID  andBool CALLER_ID  <Int (2 ^Int 160)
     andBool 0 <=Int ORIGIN_ID  andBool ORIGIN_ID  <Int (2 ^Int 160)
     andBool 0 <=Int CALL_DEPTH andBool CALL_DEPTH <Int 1024
     andBool 0 <=Int FROM_ID   andBool FROM_ID   <Int (2 ^Int 160)
andBool 0 <=Int TO_ID     andBool TO_ID     <Int (2 ^Int 160)
andBool 0 <=Int VALUE     andBool VALUE     <Int (2 ^Int 256)
andBool 0 <=Int BAL_FROM  andBool BAL_FROM  <Int (2 ^Int 256)
andBool 0 <=Int BAL_TO    andBool BAL_TO    <Int (2 ^Int 256)
andBool 0 <=Int ALLOW     andBool ALLOW     <Int (2 ^Int 256)
andBool FROM_ID =/=Int TO_ID
andBool VALUE <=Int BAL_FROM
andBool VALUE <=Int ALLOW
andBool VALUE >Int 0
andBool #hashedLocation("Solidity", 2, FROM_ID CALLER_ID) =/=Int #hashedLocation("Solidity", 1, TO_ID)
andBool #hashedLocation("Solidity", 2, FROM_ID CALLER_ID) =/=Int #hashedLocation("Solidity", 1, FROM_ID)
andBool #hashedLocation("Solidity", 1, FROM_ID) =/=Int #hashedLocation("Solidity", 1, TO_ID)


endmodule

