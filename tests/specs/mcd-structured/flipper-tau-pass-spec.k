requires "verification.k"

module FLIPPER-TAU-PASS-SPEC
    imports VERIFICATION

    // Flipper_tau
    claim [Flipper.tau.pass]:
      <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
      <mode> NORMAL </mode>
      <schedule> ISTANBUL </schedule>
      <useGas> true </useGas>
      <ethereum>
        <evm>
          <output> _ => #buf(32, Tau) </output>
          <statusCode> _ => EVMC_SUCCESS </statusCode>
          <callStack> _VCallStack </callStack>
          <interimStates> _ </interimStates>
          <touchedAccounts> _ => ?_ </touchedAccounts>
          <callState>
            <program> Flipper_bin_runtime </program>
            <jumpDests> #computeValidJumpDests(Flipper_bin_runtime) </jumpDests>
            <id> ACCT_ID </id>
            <caller> CALLER_ID </caller>
            <callData> #abiCallData("tau", .TypedArgs) +Bytes CD => ?_ </callData>
            <callValue> VCallValue </callValue>
            <wordStack> .WordStack => ?_ </wordStack>
            <localMem> .Bytes => ?_ </localMem>
            <pc> 0 => ?_ </pc>
            <gas> #gas(VGas) => #gas ( ( VGas +Int -1169 ) ) </gas>
            <memoryUsed> 0 => ?_ </memoryUsed>
            <callGas> _ => ?_ </callGas>
            <static> _ </static>
            <callDepth> VCallDepth </callDepth>
          </callState>
          <versionedHashes> _ </versionedHashes>
          <substate>
            <selfDestruct> _VSelfDestruct </selfDestruct>
            <log> _ => ?_ </log>
            <refund> _Vrefund => ?_ </refund>
            <accessedAccounts> _ => ?_ </accessedAccounts>
            <accessedStorage> _ => ?_ </accessedStorage>
            <createdAccounts> _ => ?_ </createdAccounts>
          </substate>
          <gasPrice> _ </gasPrice>
          <origin> ORIGIN_ID </origin>
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
            <number> _BLOCK_NUMBER </number>
            <gasLimit> _ </gasLimit>
            <gasUsed> _ </gasUsed>
            <timestamp> TIME </timestamp>
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
          <chainID> VChainId </chainID>
          <accounts>
            <account>
              <acctID> ACCT_ID </acctID>
              <balance> ACCT_ID_balance </balance>
              <code> Flipper_bin_runtime </code>
              <storage>
                (#Flipper.ttl_tau |-> #WordPackUInt48UInt48(Ttl, Tau))
                ACCT_ID_STORAGE
              </storage>
              <origStorage> ACCT_ID_ORIG_STORAGE </origStorage>
              <nonce> Nonce_Flipper </nonce>
              <transientStorage> _ </transientStorage>
            </account>
           ...
          </accounts>
          <txOrder> _ </txOrder>
          <txPending> _ </txPending>
          <messages> _ </messages>
          ...
        </network>
      </ethereum>
      requires #rangeAddress(ACCT_ID)
       andBool ACCT_ID =/=Int 0
       andBool #notPrecompileAddress(ACCT_ID)
       andBool #rangeAddress(CALLER_ID)
       andBool #rangeAddress(ORIGIN_ID)
       andBool #rangeUInt(256, TIME)
       andBool #rangeUInt(256, ACCT_ID_balance)
       andBool VCallDepth <=Int 1024
       andBool #rangeUInt(256, VCallValue)
       andBool #rangeUInt(256, VChainId)

       andBool (#rangeUInt(48, Ttl)
       andBool (#rangeUInt(48, Tau)
       andBool (lengthBytes(CD) <=Int 1250000000
       andBool ((VCallValue ==Int 0)))))

       andBool #rangeNonce(Nonce_Flipper)

endmodule
