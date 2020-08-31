// Static extraction
%0 = llhd.extract_element %struct, 1 : tuple<i1, i2, i3> -> i2
%1 = llhd.extract_element %array, 2 : !llhd.array<5xi1> -> i1
%2 = llhd.extract_slice %int, 3 : i10 -> i2
%3 = llhd.extract_slice %signal, 4
        : !llhd.signal<i10> -> !llhd.signal<i5>

// Dynamic extraction
%4 = llhd.dyn_extract_elment %arrayPtr, %i
        : (!llhd.ptr<!llhd.array<3xi2>>, i32) -> !llhd.ptr<i2>
%5 = llhd.dyn_extract_slice %signal, %i
        : (!llhd.sig<i10>, i32) -> !llhd.sig<i2>

// Insertion
%6 = llhd.insert_slice %target, %slice, 1 : i10, i5
%7 = llhd.insert_element %struct, %element, 0 : tuple<i1, i2, i3>, i1