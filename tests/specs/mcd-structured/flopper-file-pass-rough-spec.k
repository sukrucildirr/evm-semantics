requires "verification.k"

module FLOPPER-FILE-PASS-ROUGH-SPEC
    imports VERIFICATION

    // // Flopper_file
    // claim [Flopper.file.pass.rough]:
    //   <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
    //   <mode> NORMAL </mode>
    //   <schedule> ISTANBUL </schedule>
    //   <useGas> true </useGas>
    //   <ethereum>
    //     <evm>
    //       <output> .Bytes </output>
    //       <statusCode> _ => EVMC_SUCCESS </statusCode>
    //       <callStack> _VCallStack </callStack>
    //       <interimStates> _ </interimStates>
    //       <touchedAccounts> _ => ?_ </touchedAccounts>
    //       <callState>
    //         <program> Flopper_bin_runtime </program>
    //         <jumpDests> #computeValidJumpDests(Flopper_bin_runtime) </jumpDests>
    //         <id> ACCT_ID </id>
    //         <caller> CALLER_ID </caller>
    //         <callData> #abiCallData("file", #bytes32(ABI_what), #uint256(ABI_data)) +Bytes CD => ?_ </callData>
    //         <callValue> VCallValue </callValue>
    //         <wordStack> .WordStack => ?_ </wordStack>
    //         <localMem> .Bytes => ?_ </localMem>
    //         <pc> 0 => ?_ </pc>
    //         <gas> #gas(VGas) => ?_ </gas>
    //         <memoryUsed> 0 => ?_ </memoryUsed>
    //         <callGas> _ => ?_ </callGas>
    //         <static> false </static>
    //         <callDepth> VCallDepth </callDepth>
    //       </callState>
    //       <substate>
    //         <selfDestruct> _VSelfDestruct </selfDestruct>
    //         <log> _ => ?_ </log>
    //         <refund> _Vrefund => ?_ </refund>
    //         <accessedAccounts> _ => ?_ </accessedAccounts>
    //         <accessedStorage> _ => ?_ </accessedStorage>
    //       </substate>
    //       <gasPrice> _ </gasPrice>
    //       <origin> ORIGIN_ID </origin>
    //       <blockhashes> _ </blockhashes>
    //       <block>
    //         <previousHash> _ </previousHash>
    //         <ommersHash> _ </ommersHash>
    //         <coinbase> _ </coinbase>
    //         <stateRoot> _ </stateRoot>
    //         <transactionsRoot> _ </transactionsRoot>
    //         <receiptsRoot> _ </receiptsRoot>
    //         <logsBloom> _ </logsBloom>
    //         <difficulty> _ </difficulty>
    //         <number> _BLOCK_NUMBER </number>
    //         <gasLimit> _ </gasLimit>
    //         <gasUsed> _ </gasUsed>
    //         <timestamp> TIME </timestamp>
    //         <extraData> _ </extraData>
    //         <mixHash> _ </mixHash>
    //         <blockNonce> _ </blockNonce>
    //         <baseFee> _ </baseFee>
    //         <ommerBlockHeaders> _ </ommerBlockHeaders>
    //         <withdrawalsRoot> _ </withdrawalsRoot>
    //         <blobGasUsed> _ </blobGasUsed>
    //         <excessBlobGas> _ </excessBlobGas>
    //         ...
    //       </block>
    //       ...
    //  </evm>
    //     <network>
    //       <chainID> VChainId </chainID>
    //       <accounts>
    //         <account>
    //           <acctID> ACCT_ID </acctID>
    //           <balance> ACCT_ID_balance </balance>
    //           <code> Flopper_bin_runtime </code>
    //           <storage>
    //             (#Flopper.wards[CALLER_ID] |-> May)
    //             (#Flopper.beg |-> Beg)
    //             (#Flopper.pad |-> Pad)
    //             (#Flopper.ttl_tau |-> #WordPackUInt48UInt48(Ttl, Tau))
    //             ACCT_ID_STORAGE =>
    //               (#Flopper.wards[CALLER_ID] |-> May)
    //               (#Flopper.beg |-> #if ABI_what ==Int #string2Word("beg") #then ABI_data #else Beg #fi)
    //               (#Flopper.pad |-> #if ABI_what ==Int #string2Word("pad") #then ABI_data #else Pad #fi)
    //               // TODO: this should replace `?NEW_ACCT_ID_STORAGE` once booster map unification improves
    //               // (#Flopper.ttl_tau |-> #if ABI_what ==Int #string2Word("ttl") #then #WordPackUInt48UInt48(maxUInt48 &Int ABI_data, Tau) #else (#if ABI_what ==Int #string2Word("tau") #then #WordPackUInt48UInt48(Ttl, maxUInt48 &Int ABI_data) #else #WordPackUInt48UInt48(Ttl, Tau) #fi) #fi)
    //               // ACCT_ID_STORAGE
    //               ?NEW_ACCT_ID_STORAGE
    //           </storage>
    //           <origStorage> ACCT_ID_ORIG_STORAGE </origStorage>
    //           <nonce> _Nonce_Flopper => ?_ </nonce>
    //           <transientStorage> _ </transientStorage>
    //         </account>
    //        ...
    //       </accounts>
    //       <txOrder> _ </txOrder>
    //       <txPending> _ </txPending>
    //       <messages> _ </messages>
    //     </network>
    //   </ethereum>
    //   requires #rangeAddress(ACCT_ID)
    //    andBool ACCT_ID =/=Int 0
    //    andBool #notPrecompileAddress(ACCT_ID)
    //    andBool #rangeAddress(CALLER_ID)
    //    andBool #rangeAddress(ORIGIN_ID)
    //    andBool #rangeUInt(256, TIME)
    //    andBool #rangeUInt(256, ACCT_ID_balance)
    //    andBool VCallDepth <=Int 1024
    //    andBool #rangeUInt(256, VCallValue)
    //    andBool #rangeUInt(256, VChainId)

    //    andBool (#rangeBytes(32, ABI_what)
    //    andBool (#rangeUInt(256, ABI_data)
    //    andBool (#rangeUInt(256, May)
    //    andBool (#rangeUInt(256, Beg)
    //    andBool (#rangeUInt(256, Pad)
    //    andBool (#rangeUInt(48, Ttl)
    //    andBool (#rangeUInt(48, Tau)
    //    andBool ((lengthBytes(CD) <=Int 1250000000)
    //    andBool ((May ==Int 1)
    //    andBool ((VCallValue ==Int 0)
    //    andBool (((ABI_what ==Int #string2Word("beg")) orBool (ABI_what ==Int #string2Word("pad")) orBool (ABI_what ==Int #string2Word("ttl")) orBool (ABI_what ==Int #string2Word("tau"))))))))))))))

    //    // TODO: This should be removed once booster map unification improves
    //    ensures #lookup(?NEW_ACCT_ID_STORAGE, #Flopper.ttl_tau) ==Int #if ABI_what ==Int #string2Word("ttl") #then #WordPackUInt48UInt48(maxUInt48 &Int ABI_data, Tau) #else (#if ABI_what ==Int #string2Word("tau") #then #WordPackUInt48UInt48(Ttl, maxUInt48 &Int ABI_data) #else #WordPackUInt48UInt48(Ttl, Tau) #fi) #fi

endmodule
