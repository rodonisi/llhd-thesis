%0 = llhd.const 0 : i1
%1 = llhd.sig "i1_sig" %0 : i1
%2 = llhd.const 123 : i32
%3 = llhd.sig "i32_sig" %2 : i32
%4 = llhd.prb %1 : !llhd.sig<i1>
%5 = llhd.not %4 : i1
%6 = llhd.const #llhd.time<1ns, 0d, 0e> : !llhd.time
llhd.drv %1, %5 after %6 : !llhd.sig<i1>