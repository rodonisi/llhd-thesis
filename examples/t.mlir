  llvm.func @bar(%arg0: !llvm<"i8*">,
        %arg1: !llvm<"{ i32, i32, [0 x i1]*, { i1 } }*">,
        %arg2: !llvm<"{ i8*, i64, i64, i64 }*">) {
    [...]
  ^bb2:  // pred: ^bb1
    %6 = llvm.mlir.constant(false) : !llvm.i1
    %7 = llvm.mlir.constant(0 : i32) : !llvm.i32
    %8 = llvm.mlir.constant(3 : i32) : !llvm.i32
    %9 = llvm.mlir.constant(0 : i32) : !llvm.i32
    %10 = llvm.getelementptr %arg1[%7, %8, %9] : [...]
    llvm.store %6, %10 : !llvm<"i1*">
    llvm.br ^bb3
  ^bb3:  // pred: ^bb2
    %11 = llvm.mlir.constant(0 : i32) : !llvm.i32
    %12 = llvm.mlir.constant(3 : i32) : !llvm.i32
    %13 = llvm.mlir.constant(0 : i32) : !llvm.i32
    %14 = llvm.getelementptr %arg1[%11, %12, %13] : [...]
    %15 = llvm.load %14 : !llvm<"i1*">
    llhd.not %15
    llhd.halt
  ^bb4:  // pred: ^bb1
    llvm.return
  }