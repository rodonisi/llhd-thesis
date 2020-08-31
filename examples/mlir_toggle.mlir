llhd.entity @root () -> () {
    %0 = llhd.const 0 : i1
    %toggle = llhd.sig "toggle" %0 : i1
    llhd.inst "process" @process () -> (%toggle) : () -> (!llhd.sig<i1>)
}

llhd.proc @process () -> (%toggle : !llhd.sig<i1>) {
    br ^loop
^loop:
    %0 = llhd.prb %toggle : !llhd.sig<i1>
    %1 = llhd.not %0 : i1
    %t = llhd.const #llhd.time<1ns, 0d, 0e> : !llhd.time
    llhd.drv %toggle, %1 after %t : !llhd.sig<i1>
    llhd.wait (%toggle : !llhd.sig<i1>), ^loop
}