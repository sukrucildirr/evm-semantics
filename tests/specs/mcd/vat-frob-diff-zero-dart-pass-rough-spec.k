requires "verification.k"
requires "vat-arithmetic-spec.k"

module VAT-FROB-DIFF-ZERO-DART-PASS-ROUGH-SPEC
    imports VERIFICATION
    imports VAT-ARITHMETIC-SPEC

    // Vat_frob-diff-zero-dart
    claim [Vat.frob-diff-zero-dart.pass.rough]:
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
            <callData> #abiCallData("frob", #bytes32(ABI_i), #address(ABI_u), #address(ABI_v), #address(ABI_w), #int256(ABI_dink), #int256(ABI_dart)) +Bytes CD => ?_ </callData>
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
              <storage> ACCT_ID_STORAGE => ACCT_ID_STORAGE [ #Vat.gem[ABI_i][ABI_v] <- Gem_iv  -Int ABI_dink ]  [ #Vat.urns[ABI_i][ABI_u].ink <- Urn_ink +Int ABI_dink ] </storage>
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
       andBool (#rangeAddress(ABI_v)
       andBool (#rangeAddress(ABI_w)
       andBool (#rangeSInt(256, ABI_dink)
       andBool (#rangeSInt(256, ABI_dart)
       andBool (#rangeUInt(256, Ilk_rate)
       andBool (#rangeUInt(256, Ilk_line)
       andBool (#rangeUInt(256, Ilk_spot)
       andBool (#rangeUInt(256, Ilk_dust)
       andBool (#rangeUInt(256, Ilk_Art)
       andBool (#rangeUInt(256, Urn_ink)
       andBool (#rangeUInt(256, Urn_art)
       andBool (#rangeUInt(256, Gem_iv)
       andBool (#rangeUInt(256, Dai_w)
       andBool (#rangeUInt(256, Debt)
       andBool (#rangeUInt(256, Line)
       andBool (#rangeUInt(256, Can_u)
       andBool (#rangeUInt(256, Can_v)
       andBool (#rangeUInt(256, Can_w)
       andBool (#rangeUInt(256, Live)
       andBool ((lengthBytes(CD) <=Int 1250000000)
       andBool ((ABI_u =/=Int ABI_v)
       andBool ((ABI_v =/=Int ABI_w)
       andBool ((ABI_u =/=Int ABI_w)
       andBool ((ABI_dink =/=Int 0)
       andBool ((ABI_dart ==Int 0)
       andBool (#rangeUInt(256, Junk_0)
       andBool (#rangeUInt(256, Junk_1)
       andBool (#rangeUInt(256, Junk_2)
       andBool (#rangeUInt(256, Junk_3)
       andBool (#rangeUInt(256, Junk_4)
       andBool (#rangeUInt(256, Junk_5)
       andBool (#rangeUInt(256, Junk_6)
       andBool (#rangeUInt(256, Junk_7)
       andBool (#rangeUInt(256, Junk_8)
       andBool (#rangeUInt(256, Junk_9)
       andBool (#rangeUInt(256, Junk_10)
       andBool (#rangeUInt(256, Junk_11)
       andBool (#rangeUInt(256, Junk_12)
       andBool (#rangeUInt(256, Junk_13)
       andBool (#rangeUInt(256, Junk_14)
       andBool ((((#rangeUInt(256, Urn_ink +Int ABI_dink))))
       andBool ((((#rangeUInt(256, Gem_iv  -Int ABI_dink))))
       andBool ((((#rangeUInt(256, (Urn_ink +Int ABI_dink) *Int Ilk_spot))))
       andBool ((((#rangeUInt(256, Urn_art *Int Ilk_rate))))
       andBool ((((#rangeUInt(256, Ilk_Art *Int Ilk_rate))))
       andBool (((#rangeSInt(256, Ilk_rate)))
       andBool ((VCallValue ==Int 0)
       andBool ((Live ==Int 1)
       andBool ((Ilk_rate =/=Int 0)
       andBool (((ABI_dink >=Int 0) orBool (((Urn_art *Int Ilk_rate) <=Int ((Urn_ink +Int ABI_dink) *Int Ilk_spot))))
       andBool (((ABI_dink >=Int 0) orBool (ABI_u ==Int CALLER_ID orBool Can_u ==Int 1))
       andBool (((ABI_dink <=Int 0) orBool (ABI_v ==Int CALLER_ID orBool Can_v ==Int 1))
       andBool (((Urn_art ==Int 0) orBool ((Urn_art *Int Ilk_rate) >=Int Ilk_dust)))))))))))))))))))))))))))))))))))))))))))))))))))))))))

       andBool #lookup(ACCT_ID_STORAGE, #Vat.ilks[ABI_i].rate) ==Int Ilk_rate
       andBool #lookup(ACCT_ID_STORAGE, #Vat.ilks[ABI_i].line) ==Int Ilk_line
       andBool #lookup(ACCT_ID_STORAGE, #Vat.ilks[ABI_i].spot) ==Int Ilk_spot
       andBool #lookup(ACCT_ID_STORAGE, #Vat.ilks[ABI_i].dust) ==Int Ilk_dust
       andBool #lookup(ACCT_ID_STORAGE, #Vat.Line) ==Int Line
       andBool #lookup(ACCT_ID_STORAGE, #Vat.can[ABI_u][CALLER_ID]) ==Int Can_u
       andBool #lookup(ACCT_ID_STORAGE, #Vat.can[ABI_v][CALLER_ID]) ==Int Can_v
       andBool #lookup(ACCT_ID_STORAGE, #Vat.can[ABI_w][CALLER_ID]) ==Int Can_w
       andBool #lookup(ACCT_ID_STORAGE, #Vat.debt) ==Int Debt
       andBool #lookup(ACCT_ID_STORAGE, #Vat.gem[ABI_i][ABI_v]) ==Int Gem_iv
       andBool #lookup(ACCT_ID_STORAGE, #Vat.dai[ABI_w]) ==Int Dai_w
       andBool #lookup(ACCT_ID_STORAGE, #Vat.urns[ABI_i][ABI_u].ink) ==Int Urn_ink
       andBool #lookup(ACCT_ID_STORAGE, #Vat.urns[ABI_i][ABI_u].art) ==Int Urn_art
       andBool #lookup(ACCT_ID_STORAGE, #Vat.ilks[ABI_i].Art) ==Int Ilk_Art
       andBool #lookup(ACCT_ID_STORAGE, #Vat.live) ==Int Live
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.ilks[ABI_i].rate) ==Int Junk_0
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.ilks[ABI_i].line) ==Int Junk_1
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.ilks[ABI_i].spot) ==Int Junk_2
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.ilks[ABI_i].dust) ==Int Junk_3
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.Line) ==Int Junk_4
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.can[ABI_u][CALLER_ID]) ==Int Junk_5
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.can[ABI_v][CALLER_ID]) ==Int Junk_6
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.can[ABI_w][CALLER_ID]) ==Int Junk_7
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.debt) ==Int Junk_8
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.gem[ABI_i][ABI_v]) ==Int Junk_9
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.dai[ABI_w]) ==Int Junk_10
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.urns[ABI_i][ABI_u].ink) ==Int Junk_11
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.urns[ABI_i][ABI_u].art) ==Int Junk_12
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.ilks[ABI_i].Art) ==Int Junk_13
       andBool #lookup(ACCT_ID_ORIG_STORAGE, #Vat.live) ==Int Junk_14
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.ilks[ABI_i].line
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.ilks[ABI_i].spot
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.ilks[ABI_i].dust
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.Line
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.can[ABI_u][CALLER_ID]
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.can[ABI_v][CALLER_ID]
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.can[ABI_w][CALLER_ID]
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.debt
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.gem[ABI_i][ABI_v]
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.dai[ABI_w]
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.ilks[ABI_i].rate =/=Int #Vat.live
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.ilks[ABI_i].spot
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.ilks[ABI_i].dust
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.Line
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.can[ABI_u][CALLER_ID]
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.can[ABI_v][CALLER_ID]
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.can[ABI_w][CALLER_ID]
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.debt
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.gem[ABI_i][ABI_v]
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.dai[ABI_w]
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.ilks[ABI_i].line =/=Int #Vat.live
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.ilks[ABI_i].dust
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.Line
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.can[ABI_u][CALLER_ID]
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.can[ABI_v][CALLER_ID]
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.can[ABI_w][CALLER_ID]
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.debt
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.gem[ABI_i][ABI_v]
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.dai[ABI_w]
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.ilks[ABI_i].spot =/=Int #Vat.live
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.Line
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.can[ABI_u][CALLER_ID]
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.can[ABI_v][CALLER_ID]
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.can[ABI_w][CALLER_ID]
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.debt
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.gem[ABI_i][ABI_v]
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.dai[ABI_w]
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.ilks[ABI_i].dust =/=Int #Vat.live
       andBool #Vat.Line =/=Int #Vat.can[ABI_u][CALLER_ID]
       andBool #Vat.Line =/=Int #Vat.can[ABI_v][CALLER_ID]
       andBool #Vat.Line =/=Int #Vat.can[ABI_w][CALLER_ID]
       andBool #Vat.Line =/=Int #Vat.debt
       andBool #Vat.Line =/=Int #Vat.gem[ABI_i][ABI_v]
       andBool #Vat.Line =/=Int #Vat.dai[ABI_w]
       andBool #Vat.Line =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.Line =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.Line =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.Line =/=Int #Vat.live
       andBool #Vat.can[ABI_u][CALLER_ID] =/=Int #Vat.can[ABI_v][CALLER_ID]
       andBool #Vat.can[ABI_u][CALLER_ID] =/=Int #Vat.can[ABI_w][CALLER_ID]
       andBool #Vat.can[ABI_u][CALLER_ID] =/=Int #Vat.debt
       andBool #Vat.can[ABI_u][CALLER_ID] =/=Int #Vat.gem[ABI_i][ABI_v]
       andBool #Vat.can[ABI_u][CALLER_ID] =/=Int #Vat.dai[ABI_w]
       andBool #Vat.can[ABI_u][CALLER_ID] =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.can[ABI_u][CALLER_ID] =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.can[ABI_u][CALLER_ID] =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.can[ABI_u][CALLER_ID] =/=Int #Vat.live
       andBool #Vat.can[ABI_v][CALLER_ID] =/=Int #Vat.can[ABI_w][CALLER_ID]
       andBool #Vat.can[ABI_v][CALLER_ID] =/=Int #Vat.debt
       andBool #Vat.can[ABI_v][CALLER_ID] =/=Int #Vat.gem[ABI_i][ABI_v]
       andBool #Vat.can[ABI_v][CALLER_ID] =/=Int #Vat.dai[ABI_w]
       andBool #Vat.can[ABI_v][CALLER_ID] =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.can[ABI_v][CALLER_ID] =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.can[ABI_v][CALLER_ID] =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.can[ABI_v][CALLER_ID] =/=Int #Vat.live
       andBool #Vat.can[ABI_w][CALLER_ID] =/=Int #Vat.debt
       andBool #Vat.can[ABI_w][CALLER_ID] =/=Int #Vat.gem[ABI_i][ABI_v]
       andBool #Vat.can[ABI_w][CALLER_ID] =/=Int #Vat.dai[ABI_w]
       andBool #Vat.can[ABI_w][CALLER_ID] =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.can[ABI_w][CALLER_ID] =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.can[ABI_w][CALLER_ID] =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.can[ABI_w][CALLER_ID] =/=Int #Vat.live
       andBool #Vat.debt =/=Int #Vat.gem[ABI_i][ABI_v]
       andBool #Vat.debt =/=Int #Vat.dai[ABI_w]
       andBool #Vat.debt =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.debt =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.debt =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.debt =/=Int #Vat.live
       andBool #Vat.gem[ABI_i][ABI_v] =/=Int #Vat.dai[ABI_w]
       andBool #Vat.gem[ABI_i][ABI_v] =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.gem[ABI_i][ABI_v] =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.gem[ABI_i][ABI_v] =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.gem[ABI_i][ABI_v] =/=Int #Vat.live
       andBool #Vat.dai[ABI_w] =/=Int #Vat.urns[ABI_i][ABI_u].ink
       andBool #Vat.dai[ABI_w] =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.dai[ABI_w] =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.dai[ABI_w] =/=Int #Vat.live
       andBool #Vat.urns[ABI_i][ABI_u].ink =/=Int #Vat.urns[ABI_i][ABI_u].art
       andBool #Vat.urns[ABI_i][ABI_u].ink =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.urns[ABI_i][ABI_u].ink =/=Int #Vat.live
       andBool #Vat.urns[ABI_i][ABI_u].art =/=Int #Vat.ilks[ABI_i].Art
       andBool #Vat.urns[ABI_i][ABI_u].art =/=Int #Vat.live
       andBool #Vat.ilks[ABI_i].Art =/=Int #Vat.live

    [depends(VAT-ARITHMETIC-SPEC.Vat.addui.pass,VAT-ARITHMETIC-SPEC.Vat.subui.pass,VAT-ARITHMETIC-SPEC.Vat.mului.pass,VAT-ARITHMETIC-SPEC.Vat.muluu.pass)]

endmodule
