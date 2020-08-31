llhd.proc @bar () -> (%out0 : !llhd.sig<i1>) {
    br ^entry
^entry:
    %0 = llhd.prb %out0 : !llhd.sig<i1>
    %1 = llhd.not %0 : i1
    %2 = llhd.const #llhd.time<1ns, 0d, 0e> : !llhd.time
    llhd.drv %out0, %1 after %2 : !llhd.sig<i1>
    llhd.wait (%out0 : !llhd.sig<i1>), ^entry
}