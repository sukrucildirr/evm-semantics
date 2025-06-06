requires "verification.k"

module FLOPPER-KICK-PASS-ROUGH-SPEC
    imports VERIFICATION

    // Flopper_kick
    claim [Flopper.kick.pass.rough]:
      <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
      <mode> NORMAL </mode>
      <schedule> ISTANBUL </schedule>
      <useGas> true </useGas>
      <ethereum>
        <evm>
          <output> _ => #buf(32, 1 +Int Kicks) </output>
          <statusCode> _ => EVMC_SUCCESS </statusCode>
          <callStack> _VCallStack </callStack>
          <interimStates> _ </interimStates>
          <touchedAccounts> _ => ?_ </touchedAccounts>
          <callState>
            <program> Flopper_bin_runtime </program>
            <jumpDests> #computeValidJumpDests(Flopper_bin_runtime) </jumpDests>
            <id> ACCT_ID </id>
            <caller> CALLER_ID </caller>
            <callData> #abiCallData("kick", #address(ABI_gal), #uint256(ABI_lot), #uint256(ABI_bid)) +Bytes CD => ?_ </callData>
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
              <code> Flopper_bin_runtime </code>
              <storage> ACCT_ID_STORAGE => ACCT_ID_STORAGE [ #Flopper.kicks <- 1 +Int Kicks ]  [ #Flopper.bids[1 +Int Kicks].bid <- ABI_bid ] [ #Flopper.bids[1 +Int Kicks].lot <- ABI_lot ] [ #Flopper.bids[1 +Int Kicks].guy_tic_end <- #WordPackAddrUInt48UInt48(ABI_gal, Old_tic, TIME +Int Tau) ] </storage>
              <origStorage> ACCT_ID_ORIG_STORAGE </origStorage>
              <nonce> _Nonce_Flopper => ?_ </nonce>
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

       andBool (#rangeAddress(ABI_gal)
       andBool (#rangeUInt(256, ABI_lot)
       andBool (#rangeUInt(256, ABI_bid)
       andBool (#rangeUInt(256, Live)
       andBool (#rangeUInt(256, Kicks)
       andBool (#rangeUInt(48, Ttl)
       andBool (#rangeUInt(48, Tau)
       andBool (#rangeUInt(256, Old_lot)
       andBool (#rangeUInt(256, Old_bid)
       andBool (#rangeAddress(Old_guy)
       andBool (#rangeUInt(48, Old_tic)
       andBool (#rangeUInt(48, Old_end)
       andBool (#rangeUInt(256, Ward)
       andBool ((lengthBytes(CD) <=Int 1250000000)
       andBool ((#notPrecompileAddress(Old_guy))
       andBool ((#rangeUInt(48, TIME))
       andBool (#rangeUInt(256, Junk_0)
       andBool (#rangeUInt(256, Junk_1)
       andBool (#rangeUInt(256, Junk_2)
       andBool (#rangeUInt(256, Junk_3)
       andBool (#rangeUInt(256, Junk_4)
       andBool (#rangeUInt(256, Junk_5)
       andBool (#rangeUInt(256, Junk_6)
       andBool ((((Ward ==Int 1)))
       andBool ((((Live ==Int 1)))
       andBool ((((VCallValue ==Int 0)))
       andBool (((#rangeUInt(256, Kicks +Int 1)))
       andBool ((#rangeUInt(48, TIME +Int Tau))))))))))))))))))))))))))))))

       andBool #lookup(ACCT_ID_STORAGE, #Flopper.wards[CALLER_ID]) ==Int Ward
       andBool #lookup(ACCT_ID_STORAGE, #Flopper.live) ==Int Live
       andBool #lookup(ACCT_ID_STORAGE, #Flopper.kicks) ==Int Kicks
       andBool #lookup(ACCT_ID_STORAGE, #Flopper.ttl_tau) ==Int #WordPackUInt48UInt48(Ttl, Tau)
       andBool #lookup(ACCT_ID_STORAGE, #Flopper.bids[1 +Int Kicks].bid) ==Int Old_bid
       andBool #lookup(ACCT_ID_STORAGE, #Flopper.bids[1 +Int Kicks].lot) ==Int Old_lot
       andBool #lookup(ACCT_ID_STORAGE, #Flopper.bids[1 +Int Kicks].guy_tic_end) ==Int #WordPackAddrUInt48UInt48(Old_guy, Old_tic, Old_end)
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Flopper.wards[CALLER_ID]) ==Int Junk_0
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Flopper.live) ==Int Junk_1
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Flopper.kicks) ==Int Junk_2
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Flopper.ttl_tau) ==Int Junk_3
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Flopper.bids[1 +Int Kicks].bid) ==Int Junk_4
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Flopper.bids[1 +Int Kicks].lot) ==Int Junk_5
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Flopper.bids[1 +Int Kicks].guy_tic_end) ==Int Junk_6
       andBool #Flopper.wards[CALLER_ID] =/=Int #Flopper.live
       andBool #Flopper.wards[CALLER_ID] =/=Int #Flopper.kicks
       andBool #Flopper.wards[CALLER_ID] =/=Int #Flopper.ttl_tau
       andBool #Flopper.wards[CALLER_ID] =/=Int #Flopper.bids[1 +Int Kicks].bid
       andBool #Flopper.wards[CALLER_ID] =/=Int #Flopper.bids[1 +Int Kicks].lot
       andBool #Flopper.wards[CALLER_ID] =/=Int #Flopper.bids[1 +Int Kicks].guy_tic_end
       andBool #Flopper.live =/=Int #Flopper.kicks
       andBool #Flopper.live =/=Int #Flopper.ttl_tau
       andBool #Flopper.live =/=Int #Flopper.bids[1 +Int Kicks].bid
       andBool #Flopper.live =/=Int #Flopper.bids[1 +Int Kicks].lot
       andBool #Flopper.live =/=Int #Flopper.bids[1 +Int Kicks].guy_tic_end
       andBool #Flopper.kicks =/=Int #Flopper.ttl_tau
       andBool #Flopper.kicks =/=Int #Flopper.bids[1 +Int Kicks].bid
       andBool #Flopper.kicks =/=Int #Flopper.bids[1 +Int Kicks].lot
       andBool #Flopper.kicks =/=Int #Flopper.bids[1 +Int Kicks].guy_tic_end
       andBool #Flopper.ttl_tau =/=Int #Flopper.bids[1 +Int Kicks].bid
       andBool #Flopper.ttl_tau =/=Int #Flopper.bids[1 +Int Kicks].lot
       andBool #Flopper.ttl_tau =/=Int #Flopper.bids[1 +Int Kicks].guy_tic_end
       andBool #Flopper.bids[1 +Int Kicks].bid =/=Int #Flopper.bids[1 +Int Kicks].lot
       andBool #Flopper.bids[1 +Int Kicks].bid =/=Int #Flopper.bids[1 +Int Kicks].guy_tic_end
       andBool #Flopper.bids[1 +Int Kicks].lot =/=Int #Flopper.bids[1 +Int Kicks].guy_tic_end

    // Flopper_addu48u48
    claim [Flopper.addu48u48.pass]:
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
            <program> Flopper_bin_runtime </program>
            <jumpDests> #computeValidJumpDests(Flopper_bin_runtime) </jumpDests>
            <id> ACCT_ID </id>
            <caller> CALLER_ID </caller>
            <callData> _ => ?_ </callData>
            <callValue> VCallValue </callValue>
            <wordStack> ABI_y : ABI_x : JMPTO : WS  =>  JMPTO : ABI_x +Int ABI_y : WS </wordStack>
            <localMem> _ </localMem>
            <pc> 8757 => 8798 </pc>
            <gas> #gas(VGas) => #gas ( ( VGas +Int -66 ) ) </gas>
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
              <code> Flopper_bin_runtime </code>
              <storage> ACCT_ID_STORAGE => ACCT_ID_STORAGE  </storage>
              <origStorage> ACCT_ID_ORIG_STORAGE </origStorage>
              <nonce> _Nonce_Flopper => ?_ </nonce>
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

       andBool (#rangeUInt(48, ABI_x)
       andBool (#rangeUInt(48, ABI_y)
       andBool ((#sizeWordStack(WS) <=Int 100)
       andBool (#rangeUInt(256, VMemoryUsed)
       andBool ((#rangeUInt(48, ABI_x +Int ABI_y)))))))


    [trusted]


endmodule
