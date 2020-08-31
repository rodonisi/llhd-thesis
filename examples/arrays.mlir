%0 = llhd.const 0 : i15
%1 = llhd.array %0, %0, %0 : !llhd.array<3xi15>
%2 = llhd.array_uniform %0 : !llhd.array<10xi15>