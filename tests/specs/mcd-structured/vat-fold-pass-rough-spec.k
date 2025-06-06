requires "verification.k"
requires "vat-arithmetic-spec.k"

module VAT-FOLD-PASS-ROUGH-SPEC
    imports VERIFICATION
    imports VAT-ARITHMETIC-SPEC

    // Vat_fold
    claim [Vat.fold.pass.rough]:
      <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
      <mode> NORMAL </mode>
      <schedule> ISTANBUL </schedule>
      <useGas> true </useGas>
      <ethereum>
        <evm>
          <output> .Bytes </output>
          <statusCode> _ => EVMC_SUCCESS </statusCode>
          <callStack> _VCallStack </callStack>
          <interimStates> _ </interimStates>
          <touchedAccounts> _ => ?_ </touchedAccounts>
          <callState>
            <program> Vat_bin_runtime </program>
            <jumpDests> #computeValidJumpDests(Vat_bin_runtime) </jumpDests>
            <id> ACCT_ID </id>
            <caller> CALLER_ID </caller>
            <callData> #abiCallData("fold", #bytes32(ABI_i), #address(ABI_u), #int256(ABI_rate)) +Bytes CD => ?_ </callData>
            <callValue> VCallValue </callValue>
            <wordStack> .WordStack => ?_ </wordStack>
            <localMem> .Bytes => ?_ </localMem>
            <pc> 0 => ?_ </pc>
            <gas> #gas(VGas) => ?_ </gas>
            <memoryUsed> 0 => ?_ </memoryUsed>
            <callGas> _ => ?_ </callGas>
            <static> false </static>
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
              <code> Vat_bin_runtime </code>
              <storage>
                (#Vat.wards[CALLER_ID] |-> May)
                (#Vat.ilks[ABI_i].Art |-> Art_i)
                (#Vat.live |-> Live)
                (#Vat.ilks[ABI_i].rate |-> Rate_i)
                (#Vat.dai[ABI_u] |-> Dai_u)
                (#Vat.debt |-> Debt)
                ACCT_ID_STORAGE =>
                  (#Vat.wards[CALLER_ID] |-> May)
                  (#Vat.ilks[ABI_i].Art |-> Art_i)
                  (#Vat.live |-> Live)
                  (#Vat.ilks[ABI_i].rate |-> Rate_i +Int ABI_rate)
                  (#Vat.dai[ABI_u] |-> Dai_u +Int Art_i *Int ABI_rate)
                  (#Vat.debt |-> Debt +Int Art_i *Int ABI_rate)
                  ACCT_ID_STORAGE
              </storage>
              <origStorage> ACCT_ID_ORIG_STORAGE </origStorage>
              <nonce> _Nonce_Vat => ?_ </nonce>
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

       andBool (#rangeBytes(32, ABI_i)
       andBool (#rangeAddress(ABI_u)
       andBool (#rangeSInt(256, ABI_rate)
       andBool (#rangeUInt(256, May)
       andBool (#rangeUInt(256, Rate_i)
       andBool (#rangeUInt(256, Dai_u)
       andBool (#rangeUInt(256, Art_i)
       andBool (#rangeUInt(256, Debt)
       andBool (lengthBytes(CD) <=Int 1250000000
       andBool (#rangeUInt(256, Junk_0)
       andBool (#rangeUInt(256, Junk_1)
       andBool (#rangeUInt(256, Junk_2)
       andBool (#rangeUInt(256, Junk_3)
       andBool (#rangeUInt(256, Junk_4)
       andBool (#rangeUInt(256, Junk_5)
       andBool ((((VCallValue ==Int 0)))
       andBool ((((May ==Int 1)))
       andBool ((((Live ==Int 1)))
       andBool ((((Art_i <=Int maxSInt256)))
       andBool (((#rangeSInt(256, Art_i *Int ABI_rate)))
       andBool ((#rangeUInt(256, Rate_i +Int ABI_rate))
       andBool ((#rangeUInt(256, Dai_u  +Int (Art_i *Int ABI_rate)))
       andBool ((#rangeUInt(256, Debt   +Int (Art_i *Int ABI_rate))))))))))))))))))))))))))

    [depends(VAT-ARITHMETIC-SPEC.Vat.addui.pass,VAT-ARITHMETIC-SPEC.Vat.mului.pass)]

endmodule
