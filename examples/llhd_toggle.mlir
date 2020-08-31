entity @root () -> () {
    %0 = const i1 0
    %toggle = sig i1 %0
    inst @process () -> (i1$ %toggle)
}

proc @process () -> (i1$ %toggle) {
loop:
    %0 = prb i1$ %toggle
    %1 = not i1 %0
    %t = const time 1ns
    drv i1$ %toggle, %1 after %t
    wait %loop, %toggle
}