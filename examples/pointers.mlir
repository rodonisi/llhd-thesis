%0 = llhd.const 0 : i10
%1 = llhd.var %0 : i10
%2 = llhd.load %1 : !llhd.ptr<i10>
%3 = llhd.not %2 : i10
llhd.store %1, %3 : !llhd.ptr<i10>