; ModuleID = 'FYCat.m'
source_filename = "FYCat.m"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%0 = type opaque
%1 = type opaque
%2 = type opaque
%struct._class_t = type { %struct._class_t*, %struct._class_t*, %struct._objc_cache*, i8* (i8*, i8*)**, %struct._class_ro_t* }
%struct._objc_cache = type opaque
%struct._class_ro_t = type { i32, i32, i32, i8*, i8*, %struct.__method_list_t*, %struct._objc_protocol_list*, %struct._ivar_list_t*, i8*, %struct._prop_list_t* }
%struct.__method_list_t = type { i32, i32, [0 x %struct._objc_method] }
%struct._objc_method = type { i8*, i8*, i8* }
%struct._objc_protocol_list = type { i64, [0 x %struct._protocol_t*] }
%struct._protocol_t = type { i8*, i8*, %struct._objc_protocol_list*, %struct.__method_list_t*, %struct.__method_list_t*, %struct.__method_list_t*, %struct.__method_list_t*, %struct._prop_list_t*, i32, i32, i8**, i8*, %struct._prop_list_t* }
%struct._ivar_list_t = type { i32, i32, [0 x %struct._ivar_t] }
%struct._ivar_t = type { i64*, i8*, i8*, i32, i32 }
%struct._prop_list_t = type { i32, i32, [0 x %struct._prop_t] }
%struct._prop_t = type { i8*, i8* }
%struct._objc_super = type { i8*, i8* }

@"OBJC_CLASS_$_NSMethodSignature" = external global %struct._class_t
@"OBJC_CLASSLIST_REFERENCES_$_" = private global %struct._class_t* @"OBJC_CLASS_$_NSMethodSignature", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@.str = private unnamed_addr constant [4 x i8] c"v@:\00", align 1
@OBJC_METH_VAR_NAME_ = private unnamed_addr constant [24 x i8] c"signatureWithObjCTypes:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_ = private externally_initialized global i8* getelementptr inbounds ([24 x i8], [24 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@"OBJC_CLASS_$_FYCat" = global %struct._class_t { %struct._class_t* @"OBJC_METACLASS_$_FYCat", %struct._class_t* @"OBJC_CLASS_$_NSObject", %struct._objc_cache* @_objc_empty_cache, i8* (i8*, i8*)** null, %struct._class_ro_t* @"\01l_OBJC_CLASS_RO_$_FYCat" }, section "__DATA, __objc_data", align 8
@"OBJC_CLASSLIST_SUP_REFS_$_" = private global %struct._class_t* @"OBJC_CLASS_$_FYCat", section "__DATA,__objc_superrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.1 = private unnamed_addr constant [19 x i8] c"forwardInvocation:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.2 = private externally_initialized global i8* getelementptr inbounds ([19 x i8], [19 x i8]* @OBJC_METH_VAR_NAME_.1, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@_objc_empty_cache = external global %struct._objc_cache
@"OBJC_METACLASS_$_NSObject" = external global %struct._class_t
@OBJC_CLASS_NAME_ = private unnamed_addr constant [6 x i8] c"FYCat\00", section "__TEXT,__objc_classname,cstring_literals", align 1
@"\01l_OBJC_METACLASS_RO_$_FYCat" = private global %struct._class_ro_t { i32 1, i32 40, i32 40, i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), %struct.__method_list_t* null, %struct._objc_protocol_list* null, %struct._ivar_list_t* null, i8* null, %struct._prop_list_t* null }, section "__DATA, __objc_const", align 8
@"OBJC_METACLASS_$_FYCat" = global %struct._class_t { %struct._class_t* @"OBJC_METACLASS_$_NSObject", %struct._class_t* @"OBJC_METACLASS_$_NSObject", %struct._objc_cache* @_objc_empty_cache, i8* (i8*, i8*)** null, %struct._class_ro_t* @"\01l_OBJC_METACLASS_RO_$_FYCat" }, section "__DATA, __objc_data", align 8
@"OBJC_CLASS_$_NSObject" = external global %struct._class_t
@OBJC_METH_VAR_NAME_.3 = private unnamed_addr constant [28 x i8] c"methodSignatureForSelector:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_ = private unnamed_addr constant [11 x i8] c"@24@0:8:16\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_.4 = private unnamed_addr constant [11 x i8] c"v24@0:8@16\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@"\01l_OBJC_$_INSTANCE_METHODS_FYCat" = private global { i32, i32, [2 x %struct._objc_method] } { i32 24, i32 2, [2 x %struct._objc_method] [%struct._objc_method { i8* getelementptr inbounds ([28 x i8], [28 x i8]* @OBJC_METH_VAR_NAME_.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* bitcast (%0* (%1*, i8*, i8*)* @"\01-[FYCat methodSignatureForSelector:]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @OBJC_METH_VAR_NAME_.1, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_.4, i32 0, i32 0), i8* bitcast (void (%1*, i8*, %2*)* @"\01-[FYCat forwardInvocation:]" to i8*) }] }, section "__DATA, __objc_const", align 8
@"\01l_OBJC_CLASS_RO_$_FYCat" = private global %struct._class_ro_t { i32 0, i32 8, i32 8, i8* null, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), %struct.__method_list_t* bitcast ({ i32, i32, [2 x %struct._objc_method] }* @"\01l_OBJC_$_INSTANCE_METHODS_FYCat" to %struct.__method_list_t*), %struct._objc_protocol_list* null, %struct._ivar_list_t* null, i8* null, %struct._prop_list_t* null }, section "__DATA, __objc_const", align 8
@"OBJC_LABEL_CLASS_$" = private global [1 x i8*] [i8* bitcast (%struct._class_t* @"OBJC_CLASS_$_FYCat" to i8*)], section "__DATA,__objc_classlist,regular,no_dead_strip", align 8
@llvm.compiler.used = appending global [12 x i8*] [i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_" to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_ to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_SUP_REFS_$_" to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @OBJC_METH_VAR_NAME_.1, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.2 to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @OBJC_METH_VAR_NAME_.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_.4, i32 0, i32 0), i8* bitcast ({ i32, i32, [2 x %struct._objc_method] }* @"\01l_OBJC_$_INSTANCE_METHODS_FYCat" to i8*), i8* bitcast ([1 x i8*]* @"OBJC_LABEL_CLASS_$" to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  ret void
}

; Function Attrs: noinline optnone ssp uwtable
define internal %0* @"\01-[FYCat methodSignatureForSelector:]"(%1*, i8*, i8*) #1 {
  %4 = alloca %1*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store %1* %0, %1** %4, align 8
  store i8* %1, i8** %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_", align 8
  %8 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %9 = bitcast %struct._class_t* %7 to i8*
  %10 = call %0* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to %0* (i8*, i8*, i8*)*)(i8* %9, i8* %8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  ret %0* %10
}

; Function Attrs: nonlazybind
declare i8* @objc_msgSend(i8*, i8*, ...) #2

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01-[FYCat forwardInvocation:]"(%1*, i8*, %2*) #1 {
  %4 = alloca %1*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %2*, align 8
  %7 = alloca %struct._objc_super, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %1* %0, %1** %4, align 8
  store i8* %1, i8** %5, align 8
  store %2* %2, %2** %6, align 8
  %11 = load %1*, %1** %4, align 8
  %12 = load %2*, %2** %6, align 8
  %13 = bitcast %1* %11 to i8*
  %14 = getelementptr inbounds %struct._objc_super, %struct._objc_super* %7, i32 0, i32 0
  store i8* %13, i8** %14, align 8
  %15 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_SUP_REFS_$_", align 8
  %16 = bitcast %struct._class_t* %15 to i8*
  %17 = getelementptr inbounds %struct._objc_super, %struct._objc_super* %7, i32 0, i32 1
  store i8* %16, i8** %17, align 8
  %18 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.2, align 8, !invariant.load !9
  call void bitcast (i8* (%struct._objc_super*, i8*, ...)* @objc_msgSendSuper2 to void (%struct._objc_super*, i8*, %2*)*)(%struct._objc_super* %7, i8* %18, %2* %12)
  store i32 10, i32* %8, align 4
  store i32 11, i32* %9, align 4
  %19 = load i32, i32* %8, align 4
  %20 = load i32, i32* %9, align 4
  %21 = add nsw i32 %19, %20
  store i32 %21, i32* %10, align 4
  %22 = load i32, i32* %10, align 4
  call void @test(i32 %22)
  ret void
}

declare i8* @objc_msgSendSuper2(%struct._objc_super*, i8*, ...)

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nonlazybind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 14]}
!1 = !{i32 1, !"Objective-C Version", i32 2}
!2 = !{i32 1, !"Objective-C Image Info Version", i32 0}
!3 = !{i32 1, !"Objective-C Image Info Section", !"__DATA,__objc_imageinfo,regular,no_dead_strip"}
!4 = !{i32 4, !"Objective-C Garbage Collection", i32 0}
!5 = !{i32 1, !"Objective-C Class Properties", i32 64}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{!"Apple LLVM version 10.0.1 (clang-1001.0.46.4)"}
!9 = !{}
