requires "verification.k"

module STORAGEVAR03-SPEC
  imports VERIFICATION

  // fn-execute
  claim
    <k> (#execute => #halt) ~> _ </k>
    <mode> NORMAL </mode>
    <schedule> ISTANBUL </schedule>
    <useGas> true </useGas>
    <ethereum>
      <evm>
        <output> _ => ?_ </output>
        <statusCode> _ => EVMC_REVERT </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => ?_ </touchedAccounts>
        <callState>
          <program> #parseByteStack("0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806361461954146044575b600080fd5b348015604f57600080fd5b506056606c565b6040518082815260200191505060405180910390f35b6000600560008190555060001515608257600080fd5b9056fea165627a7a723058206c2e2e763fa3e914d5806ac22d4cf3bd0ff53cd57740965d5e5d05934668a9110029") </program>
          <jumpDests> #computeValidJumpDests(#parseByteStack("0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806361461954146044575b600080fd5b348015604f57600080fd5b506056606c565b6040518082815260200191505060405180910390f35b6000600560008190555060001515608257600080fd5b9056fea165627a7a723058206c2e2e763fa3e914d5806ac22d4cf3bd0ff53cd57740965d5e5d05934668a9110029")) </jumpDests>
          <id> CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute", .TypedArgs) </callData> // msg.data
          <callValue> 0 </callValue> // msg.value
          <wordStack> .WordStack => ?_ </wordStack>
          <localMem> .Bytes => ?_ </localMem>
          <pc> 0 => ?_ </pc>
          <gas> #gas(_VGAS) => ?_ </gas>
          <memoryUsed> 0 => ?_ </memoryUsed>
          <callGas> _ => ?_ </callGas>
          <static> false </static> // NOTE: non-static call
          <callDepth> CD </callDepth>
        </callState>
        <versionedHashes> _ </versionedHashes>
        <substate>
          <selfDestruct> _ </selfDestruct>
          <log> _ </log>
          <refund> _ => ?_ </refund>
          <accessedAccounts> _ => ?_ </accessedAccounts>
          <accessedStorage> _ => ?_ </accessedStorage>
          <createdAccounts> _ => ?_ </createdAccounts>
        </substate>
        <gasPrice> _ </gasPrice>
        <origin> _ </origin> // tx.origin
        <blockhashes> _ </blockhashes> // block.blockhash
        <block>
          <previousHash> _ </previousHash>
          <ommersHash> _ </ommersHash>
          <coinbase> _ </coinbase> // block.coinbase
          <stateRoot> _ </stateRoot>
          <transactionsRoot> _ </transactionsRoot>
          <receiptsRoot> _ </receiptsRoot>
          <logsBloom> _ </logsBloom>
          <difficulty> _ </difficulty>
          <number> BLOCK_NUM </number> // block.number
          <gasLimit> _ </gasLimit>
          <gasUsed> _ </gasUsed>
          <timestamp> NOW </timestamp> // now = block.timestamp
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
            <acctID> CONTRACT_ID </acctID>
            <balance> CONTRACT_BAL </balance>
            <code> #parseByteStack("0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806361461954146044575b600080fd5b348015604f57600080fd5b506056606c565b6040518082815260200191505060405180910390f35b6000600560008190555060001515608257600080fd5b9056fea165627a7a723058206c2e2e763fa3e914d5806ac22d4cf3bd0ff53cd57740965d5e5d05934668a9110029") </code>
            <storage> _S => ?_S </storage>
            <origStorage> _OS </origStorage>
            <nonce> CONTRACT_NONCE </nonce>
            <transientStorage>
                _
            </transientStorage>
          </account>

          <account>
            <acctID> CALLEE_ID </acctID>
            <balance> CALLEE_BAL </balance>
            <code> _ </code>
            <storage>
                _
            </storage>
            <origStorage>
                _
            </origStorage>
            <nonce> CALLEE_NONCE </nonce>
            <transientStorage>
                _
            </transientStorage>
          </account>

          <account>
            // precompiled account for ECCREC
            <acctID> 1 </acctID>
            <balance> 0 </balance>
            <code> .Bytes </code>
            <storage> .Map </storage>
            <origStorage> .Map </origStorage>
            <nonce> 0 </nonce>
            <transientStorage> .Map </transientStorage>
          </account>


          ...
        </accounts>
        <txOrder> _ </txOrder>
        <txPending> _ </txPending>
        <messages> _ </messages>
        ...
      </network>
    </ethereum>
    requires #rangeAddress(CONTRACT_ID)
     andBool #rangeAddress(CALLEE_ID)
     andBool #rangeUInt(256, NOW)
     andBool #rangeUInt(128, BLOCK_NUM) // Solidity
     andBool #rangeUInt(256, CONTRACT_BAL)
     andBool #rangeUInt(256, CALLEE_BAL)
     andBool #rangeNonce(CONTRACT_NONCE)
     andBool #rangeNonce(CALLEE_NONCE)
     andBool #range(0 <= CD < 1024)
     andBool #rangeAddress(MSG_SENDER)

endmodule

