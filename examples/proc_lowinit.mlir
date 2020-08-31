llhd.proc @bar () -> (%out0 : !llhd.sig<i1>) {
    br ^entry
^entry:
    llhd.wait (%out0 : !llhd.sig<i1>), ^entry
}