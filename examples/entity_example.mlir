llhd.entity @foo () -> () {
    %0 = llhd.const 0 : i1
    %1 = llhd.sig "toggle" %0 : i1
    %2 = llhd.prb %1 : !llhd.sig<i1>
    %3 = llhd.not %2 : i1
    %4 = llhd.const #llhd.time<1ns, 0d, 0e> : !llhd.time
    llhd.drv %1, %3 after %4 : !llhd.sig<i1>
}