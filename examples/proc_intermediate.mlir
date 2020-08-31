 llvm.func @bar(%arg0: !llvm<"i8*">, 
        %arg1: !llvm<"{ i8*, i32, [1 x i1]*, {} }*">, 
        %arg2: !llvm<"{ i8*, i64, i64, i64 }*">) {
    %0 = llvm.mlir.constant(0 : i32) : !llvm.i32
    %1 = llvm.getelementptr %arg2[%0] : [...]
    %2 = llvm.mlir.constant(0 : i32) : !llvm.i32
    %3 = llvm.mlir.constant(1 : i32) : !llvm.i32
    %4 = llvm.getelementptr %arg1[%2, %3] : [...]
    %5 = llvm.load %4 : !llvm<"i32*">
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    %6 = llvm.mlir.constant(1 : i32) : !llvm.i32
    %7 = llvm.icmp "eq" %5, %6 : !llvm.i32
    llvm.cond_br %7, ^bb4, ^bb2
  ^bb2:  // pred: ^bb1
    %8 = llvm.mlir.constant(0 : i32) : !llvm.i32
    %9 = llvm.icmp "eq" %5, %8 : !llvm.i32
    llvm.cond_br %9, ^bb3, ^bb5
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4
  ^bb4:  // 2 preds: ^bb1, ^bb3
    %10 = llvm.mlir.constant(1 : i32) : !llvm.i32
    %11 = llvm.getelementptr %arg1[%2, %3] : [...]
    llvm.store %10, %11 : !llvm<"i32*">
    llhd.wait (%out0 : !llhd.sig<i1>), ^bb4
  ^bb5:  // pred: ^bb2
    llvm.return
}