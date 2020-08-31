%0 = "mydialect.myop"(%arg0, %arg1) {attr0="anAttribute" : !attr_ty}
        : (!arg0_ty, !arg1_ty) -> !out0_ty
%1 = mydialect.myop "anAttribute", %arg0, %arg1
        : !arg0_ty, !arg1_ty -> !out0_ty