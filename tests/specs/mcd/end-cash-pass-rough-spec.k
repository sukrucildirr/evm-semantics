requires "verification.k"

module END-CASH-PASS-ROUGH-SPEC
    imports VERIFICATION

    // End_cash
    claim [End.cash.pass.rough]:
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
            <program> End_bin_runtime </program>
            <jumpDests> #computeValidJumpDests(End_bin_runtime) </jumpDests>
            <id> ACCT_ID </id>
            <caller> CALLER_ID </caller>
            <callData> #abiCallData("cash", #bytes32(ABI_ilk), #uint256(ABI_wad)) +Bytes CD => ?_ </callData>
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
              <code> End_bin_runtime </code>
              <storage> ACCT_ID_STORAGE => ACCT_ID_STORAGE [ #End.out[ABI_ilk][CALLER_ID] <- Out +Int ABI_wad ] </storage>
              <origStorage> ACCT_ID_ORIG_STORAGE </origStorage>
              <nonce> Nonce_End </nonce>
              <transientStorage> _ </transientStorage>
            </account>
            <account>
              <acctID> Vat </acctID>
              <balance> Vat_balance </balance>
              <code> Vat_bin_runtime </code>
              <storage> Vat_STORAGE => Vat_STORAGE [ #Vat.gem[ABI_ilk][ACCT_ID] <- Gem_e -Int #rmul(ABI_wad, Fix) ] [ #Vat.gem[ABI_ilk][CALLER_ID] <- Gem_c +Int #rmul(ABI_wad, Fix) ] </storage>
              <origStorage> Vat_ORIG_STORAGE </origStorage>
              <nonce> Nonce_Vat </nonce>
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
       andBool #rangeNonce(Nonce_End)
       andBool #rangeNonce(Nonce_Vat)

       andBool (#rangeBytes(32, ABI_ilk)
       andBool (#rangeUInt(256, ABI_wad)
       andBool (#rangeAddress(Vat)
       andBool (#rangeUInt(256, Fix)
       andBool (#rangeUInt(256, Bag)
       andBool (#rangeUInt(256, Out)
       andBool (#rangeUInt(256, Gem_e)
       andBool (#rangeUInt(256, Gem_c)
       andBool (#rangeUInt(256, Vat_balance)
       andBool ((lengthBytes(CD) <=Int 1250000000)
       andBool ((#notPrecompileAddress(Vat))
       andBool ((ACCT_ID =/=Int Vat)
       andBool ((ACCT_ID =/=Int CALLER_ID)
       andBool ((Vat =/=Int 0)
       andBool (#rangeUInt(256, Junk_0)
       andBool (#rangeUInt(256, Junk_1)
       andBool (#rangeUInt(256, Junk_2)
       andBool (#rangeUInt(256, Junk_3)
       andBool (#rangeUInt(256, Junk_4)
       andBool (#rangeUInt(256, Junk_5)
       andBool (#rangeUInt(256, Junk_6)
       andBool (#rangeUInt(256, Junk_7)
       andBool (((Fix =/=Int 0))
       andBool (((Out +Int ABI_wad <=Int Bag))
       andBool (((VCallValue ==Int 0))
       andBool (((VCallDepth <Int 1024))
       andBool ((#rangeUInt(256, ABI_wad *Int Fix))
       andBool ((#rangeUInt(256, Gem_e -Int ((ABI_wad *Int Fix) /Int #Ray)))
       andBool ((#rangeUInt(256, Gem_c +Int ((ABI_wad *Int Fix) /Int #Ray))))))))))))))))))))))))))))))))

       andBool #lookup(ACCT_ID_STORAGE, #End.vat) ==Int Vat
       andBool #lookup(ACCT_ID_STORAGE, #End.fix[ABI_ilk]) ==Int Fix
       andBool #lookup(ACCT_ID_STORAGE, #End.bag[CALLER_ID]) ==Int Bag
       andBool #lookup(ACCT_ID_STORAGE, #End.out[ABI_ilk][CALLER_ID]) ==Int Out
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #End.vat) ==Int Junk_0
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #End.fix[ABI_ilk]) ==Int Junk_1
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #End.bag[CALLER_ID]) ==Int Junk_2
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #End.out[ABI_ilk][CALLER_ID]) ==Int Junk_3
       andBool #End.vat =/=Int #End.fix[ABI_ilk]
       andBool #End.vat =/=Int #End.bag[CALLER_ID]
       andBool #End.vat =/=Int #End.out[ABI_ilk][CALLER_ID]
       andBool #End.fix[ABI_ilk] =/=Int #End.bag[CALLER_ID]
       andBool #End.fix[ABI_ilk] =/=Int #End.out[ABI_ilk][CALLER_ID]
       andBool #End.bag[CALLER_ID] =/=Int #End.out[ABI_ilk][CALLER_ID]
       andBool #lookup(Vat_STORAGE, #Vat.can[ACCT_ID][ACCT_ID]) ==Int Junk_4
       andBool #lookup(Vat_STORAGE, #Vat.gem[ABI_ilk][ACCT_ID]) ==Int Gem_e
       andBool #lookup(Vat_STORAGE, #Vat.gem[ABI_ilk][CALLER_ID]) ==Int Gem_c
       andBool #lookup(Vat_ORIG_STORAGE, #Vat.can[ACCT_ID][ACCT_ID]) ==Int Junk_5
       andBool #lookup(Vat_ORIG_STORAGE, #Vat.gem[ABI_ilk][ACCT_ID]) ==Int Junk_6
       andBool #lookup(Vat_ORIG_STORAGE, #Vat.gem[ABI_ilk][CALLER_ID]) ==Int Junk_7
       andBool #Vat.can[ACCT_ID][ACCT_ID] =/=Int #Vat.gem[ABI_ilk][ACCT_ID]
       andBool #Vat.can[ACCT_ID][ACCT_ID] =/=Int #Vat.gem[ABI_ilk][CALLER_ID]
       andBool #Vat.gem[ABI_ilk][ACCT_ID] =/=Int #Vat.gem[ABI_ilk][CALLER_ID]

    // End_adduu
    claim [End.adduu.pass]:
      <k> #execute ~> CONTINUATION => #execute ~> CONTINUATION </k>
      <mode> NORMAL </mode>
      <schedule> ISTANBUL </schedule>
      <useGas> true </useGas>
      <ethereum>
        <evm>
          <output> VOutput => VOutput </output>
          <statusCode> _ => ?_ </statusCode>
          <callStack> _VCallStack </callStack>
          <interimStates> _ </interimStates>
          <touchedAccounts> _ => ?_ </touchedAccounts>
          <callState>
            <program> End_bin_runtime </program>
            <jumpDests> #computeValidJumpDests(End_bin_runtime) </jumpDests>
            <id> ACCT_ID </id>
            <caller> CALLER_ID </caller>
            <callData> _ => ?_ </callData>
            <callValue> VCallValue </callValue>
            <wordStack> ABI_y : ABI_x : JMPTO : WS  =>  JMPTO : ABI_x +Int ABI_y : WS </wordStack>
            <localMem> _ </localMem>
            <pc> 14775 => 14800 </pc>
            <gas> #gas(VGas) => #gas ( ( VGas +Int -54 ) ) </gas>
            <memoryUsed> VMemoryUsed </memoryUsed>
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
              <code> End_bin_runtime </code>
              <storage> ACCT_ID_STORAGE => ACCT_ID_STORAGE  </storage>
              <origStorage> ACCT_ID_ORIG_STORAGE </origStorage>
              <nonce> Nonce_End </nonce>
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
       andBool #rangeNonce(Nonce_End)

       andBool (#rangeUInt(256, ABI_x)
       andBool (#rangeUInt(256, ABI_y)
       andBool ((#sizeWordStack(WS) <=Int 100)
       andBool (#rangeUInt(256, VMemoryUsed)
       andBool ((#rangeUInt(256, ABI_x +Int ABI_y)))))))


    [trusted]


    // End_rmul
    claim [End.rmul.pass]:
      <k> #execute ~> CONTINUATION => #execute ~> CONTINUATION </k>
      <mode> NORMAL </mode>
      <schedule> ISTANBUL </schedule>
      <useGas> true </useGas>
      <ethereum>
        <evm>
          <output> VOutput => VOutput </output>
          <statusCode> _ => ?_ </statusCode>
          <callStack> _VCallStack </callStack>
          <interimStates> _ </interimStates>
          <touchedAccounts> _ => ?_ </touchedAccounts>
          <callState>
            <program> End_bin_runtime </program>
            <jumpDests> #computeValidJumpDests(End_bin_runtime) </jumpDests>
            <id> ACCT_ID </id>
            <caller> CALLER_ID </caller>
            <callData> _ => ?_ </callData>
            <callValue> VCallValue </callValue>
            <wordStack> ABI_y : ABI_x : JMPTO : WS  =>  JMPTO : (ABI_x *Int ABI_y) /Int #Ray : WS </wordStack>
            <localMem> _ </localMem>
            <pc> 14623 => 14663 </pc>
            <gas> #gas(VGas) => #if ABI_y ==Int 0
              #then   #gas ( ( VGas +Int -127 ) )
              #else   #gas ( ( VGas +Int -179 ) )
            #fi </gas>
            <memoryUsed> VMemoryUsed </memoryUsed>
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
              <code> End_bin_runtime </code>
              <storage> ACCT_ID_STORAGE => ACCT_ID_STORAGE  </storage>
              <origStorage> ACCT_ID_ORIG_STORAGE </origStorage>
              <nonce> Nonce_End </nonce>
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
       andBool #rangeNonce(Nonce_End)

       andBool (#rangeUInt(256, ABI_x)
       andBool (#rangeUInt(256, ABI_y)
       andBool ((#sizeWordStack(WS) <=Int 1000)
       andBool (#rangeUInt(256, VMemoryUsed)
       andBool ((#rangeUInt(256, ABI_x *Int ABI_y)))))))


    [trusted]


    // Vat_flux-diff
    claim [Vat.flux-diff.pass]:
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
            <callData> #abiCallData("flux", #bytes32(ABI_ilk), #address(ABI_src), #address(ABI_dst), #uint256(ABI_wad)) +Bytes CD => ?_ </callData>
            <callValue> VCallValue </callValue>
            <wordStack> .WordStack => ?_ </wordStack>
            <localMem> .Bytes => ?_ </localMem>
            <pc> 0 => ?_ </pc>
            <gas> #gas(VGas) => #gas ( ( ( ( VGas -Int Csstore( ISTANBUL , ( Gem_src -Int ABI_wad ) , Gem_src , Junk_1 ) ) -Int Csstore( ISTANBUL , ( Gem_dst +Int ABI_wad ) , Gem_dst , Junk_2 ) ) +Int -8307 ) ) </gas>
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
              <storage> ACCT_ID_STORAGE => ACCT_ID_STORAGE [ #Vat.gem[ABI_ilk][ABI_src] <- Gem_src -Int ABI_wad ] [ #Vat.gem[ABI_ilk][ABI_dst] <- Gem_dst +Int ABI_wad ] </storage>
              <origStorage> ACCT_ID_ORIG_STORAGE </origStorage>
              <nonce> Nonce_Vat </nonce>
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
       andBool #rangeNonce(Nonce_Vat)

       andBool (#rangeBytes(32, ABI_ilk)
       andBool (#rangeAddress(ABI_src)
       andBool (#rangeAddress(ABI_dst)
       andBool (#rangeUInt(256, ABI_wad)
       andBool (#rangeUInt(256, May)
       andBool (#rangeUInt(256, Gem_src)
       andBool (#rangeUInt(256, Gem_dst)
       andBool ((lengthBytes(CD) <=Int 1250000000)
       andBool ((ABI_src =/=Int ABI_dst)
       andBool (#rangeUInt(256, Junk_0)
       andBool (#rangeUInt(256, Junk_1)
       andBool (#rangeUInt(256, Junk_2)
       andBool ((((May ==Int 1 orBool ABI_src ==Int CALLER_ID)))
       andBool (((VCallValue ==Int 0))
       andBool ((#rangeUInt(256, Gem_src -Int ABI_wad))
       andBool ((#rangeUInt(256, Gem_dst +Int ABI_wad))))))))))))))))))

       andBool #lookup(ACCT_ID_STORAGE, #Vat.can[ABI_src][CALLER_ID]) ==Int May
       andBool #lookup(ACCT_ID_STORAGE, #Vat.gem[ABI_ilk][ABI_src]) ==Int Gem_src
       andBool #lookup(ACCT_ID_STORAGE, #Vat.gem[ABI_ilk][ABI_dst]) ==Int Gem_dst
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.can[ABI_src][CALLER_ID]) ==Int Junk_0
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.gem[ABI_ilk][ABI_src]) ==Int Junk_1
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.gem[ABI_ilk][ABI_dst]) ==Int Junk_2
       andBool #Vat.can[ABI_src][CALLER_ID] =/=Int #Vat.gem[ABI_ilk][ABI_src]
       andBool #Vat.can[ABI_src][CALLER_ID] =/=Int #Vat.gem[ABI_ilk][ABI_dst]
       andBool #Vat.gem[ABI_ilk][ABI_src] =/=Int #Vat.gem[ABI_ilk][ABI_dst]
    [trusted]


endmodule
