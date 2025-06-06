requires "../evm.md"

module BLOCKHASH-SUMMARY
    imports public EVM
    
    rule [BLOCKHASH-SUMMARY-USEGAS]: <kevm>
           <k>
             ( #next [ BLOCKHASH ] ~> .K => .K )
             ~> _K_CELL:K
           </k>
           <schedule>
             SCHEDULE_CELL:Schedule
           </schedule>
           <useGas>
             ( USEGAS_CELL:Bool => true )
           </useGas>
           <ethereum>
             <evm>
               <callState>
                 <wordStack>
                   ( ( W0:Int => #blockhash ( BLOCKHASHES_CELL:List , W0:Int , ( NUMBER_CELL:Int +Int -1 ) , 0 ) ) : _WS:WordStack )
                 </wordStack>
                 <pc>
                   ( PC_CELL:Int => ( PC_CELL:Int +Int 1 ) )
                 </pc>
                 <gas>
                   ( GAS_CELL:Int => ( GAS_CELL:Int -Int Gblockhash < SCHEDULE_CELL:Schedule > ) )
                 </gas>
                 ...
               </callState>
               <blockhashes>
                 BLOCKHASHES_CELL:List
               </blockhashes>
               <block>
                 <number>
                   NUMBER_CELL:Int
                 </number>
                 ...
               </block>
               ...
             </evm>
             ...
           </ethereum>
           ...
         </kevm>
      requires ( USEGAS_CELL:Bool
       andBool ( Gblockhash < SCHEDULE_CELL:Schedule > <=Int GAS_CELL:Int
               ))
      [priority(20), label(BLOCKHASH-SUMMARY-USEGAS)]
    
    rule [BLOCKHASH-SUMMARY-NOGAS]: <kevm>
           <k>
             ( #next [ BLOCKHASH ] ~> .K => .K )
             ~> _K_CELL:K
           </k>
           <useGas>
             ( USEGAS_CELL:Bool => false )
           </useGas>
           <ethereum>
             <evm>
               <callState>
                 <wordStack>
                   ( ( W0:Int => #blockhash ( BLOCKHASHES_CELL:List , W0:Int , ( NUMBER_CELL:Int +Int -1 ) , 0 ) ) : _WS:WordStack )
                 </wordStack>
                 <pc>
                   ( PC_CELL:Int => ( PC_CELL:Int +Int 1 ) )
                 </pc>
                 <gas>
                   _GAS_CELL:Int
                 </gas>
                 ...
               </callState>
               <blockhashes>
                 BLOCKHASHES_CELL:List
               </blockhashes>
               <block>
                 <number>
                   NUMBER_CELL:Int
                 </number>
                 ...
               </block>
               ...
             </evm>
             ...
           </ethereum>
           ...
         </kevm>
      requires ( notBool USEGAS_CELL:Bool )
      [priority(20), label(BLOCKHASH-SUMMARY-NOGAS)]

endmodule