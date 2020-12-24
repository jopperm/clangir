; RUN: opt < %s -instcombine -mtriple=x86_64-unknown-unknown -S | FileCheck %s
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define i16 @test1(float %f) {
; CHECK-LABEL: @test1(
; CHECK-NEXT:    [[TMP281:%.*]] = fadd float %f, -1.000000e+00
; CHECK-NEXT:    [[TMP373:%.*]] = fmul float [[TMP281]], 5.000000e-01
; CHECK-NEXT:    [[TMP374:%.*]] = insertelement <4 x float> undef, float [[TMP373]], i32 0
; CHECK-NEXT:    [[TMP48:%.*]] = tail call <4 x float> @llvm.x86.sse.min.ss(<4 x float> [[TMP374]], <4 x float> <float 6.553500e+04, float undef, float undef, float undef>)
; CHECK-NEXT:    [[TMP59:%.*]] = tail call <4 x float> @llvm.x86.sse.max.ss(<4 x float> [[TMP48]], <4 x float> <float 0.000000e+00, float undef, float undef, float undef>)
; CHECK-NEXT:    [[TMP_UPGRD_1:%.*]] = tail call i32 @llvm.x86.sse.cvttss2si(<4 x float> [[TMP59]])
; CHECK-NEXT:    [[TMP69:%.*]] = trunc i32 [[TMP_UPGRD_1]] to i16
; CHECK-NEXT:    ret i16 [[TMP69]]
;
  %tmp = insertelement <4 x float> poison, float %f, i32 0
  %tmp10 = insertelement <4 x float> %tmp, float 0.000000e+00, i32 1
  %tmp11 = insertelement <4 x float> %tmp10, float 0.000000e+00, i32 2
  %tmp12 = insertelement <4 x float> %tmp11, float 0.000000e+00, i32 3
  %tmp28 = tail call <4 x float> @llvm.x86.sse.sub.ss( <4 x float> %tmp12, <4 x float> < float 1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 > )
  %tmp37 = tail call <4 x float> @llvm.x86.sse.mul.ss( <4 x float> %tmp28, <4 x float> < float 5.000000e-01, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 > )
  %tmp48 = tail call <4 x float> @llvm.x86.sse.min.ss( <4 x float> %tmp37, <4 x float> < float 6.553500e+04, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00 > )
  %tmp59 = tail call <4 x float> @llvm.x86.sse.max.ss( <4 x float> %tmp48, <4 x float> zeroinitializer )
  %tmp.upgrd.1 = tail call i32 @llvm.x86.sse.cvttss2si( <4 x float> %tmp59 )
  %tmp69 = trunc i32 %tmp.upgrd.1 to i16
  ret i16 %tmp69
}

define i64 @test3(float %f, double %d) {
; CHECK-LABEL: @test3(
; CHECK-NEXT:    [[V00:%.*]] = insertelement <4 x float> undef, float %f, i32 0
; CHECK-NEXT:    [[TMP0:%.*]] = tail call i32 @llvm.x86.sse.cvtss2si(<4 x float> [[V00]])
; CHECK-NEXT:    [[V10:%.*]] = insertelement <4 x float> undef, float %f, i32 0
; CHECK-NEXT:    [[TMP1:%.*]] = tail call i64 @llvm.x86.sse.cvtss2si64(<4 x float> [[V10]])
; CHECK-NEXT:    [[V20:%.*]] = insertelement <4 x float> undef, float %f, i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = tail call i32 @llvm.x86.sse.cvttss2si(<4 x float> [[V20]])
; CHECK-NEXT:    [[V30:%.*]] = insertelement <4 x float> undef, float %f, i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i64 @llvm.x86.sse.cvttss2si64(<4 x float> [[V30]])
; CHECK-NEXT:    [[V40:%.*]] = insertelement <2 x double> undef, double %d, i32 0
; CHECK-NEXT:    [[TMP4:%.*]] = tail call i32 @llvm.x86.sse2.cvtsd2si(<2 x double> [[V40]])
; CHECK-NEXT:    [[V50:%.*]] = insertelement <2 x double> undef, double %d, i32 0
; CHECK-NEXT:    [[TMP5:%.*]] = tail call i64 @llvm.x86.sse2.cvtsd2si64(<2 x double> [[V50]])
; CHECK-NEXT:    [[V60:%.*]] = insertelement <2 x double> undef, double %d, i32 0
; CHECK-NEXT:    [[TMP6:%.*]] = tail call i32 @llvm.x86.sse2.cvttsd2si(<2 x double> [[V60]])
; CHECK-NEXT:    [[V70:%.*]] = insertelement <2 x double> undef, double %d, i32 0
; CHECK-NEXT:    [[TMP7:%.*]] = tail call i64 @llvm.x86.sse2.cvttsd2si64(<2 x double> [[V70]])
; CHECK-NEXT:    [[TMP8:%.*]] = add i32 [[TMP0]], [[TMP2]]
; CHECK-NEXT:    [[TMP9:%.*]] = add i32 [[TMP4]], [[TMP6]]
; CHECK-NEXT:    [[TMP10:%.*]] = add i32 [[TMP8]], [[TMP9]]
; CHECK-NEXT:    [[TMP11:%.*]] = sext i32 [[TMP10]] to i64
; CHECK-NEXT:    [[TMP12:%.*]] = add i64 [[TMP1]], [[TMP3]]
; CHECK-NEXT:    [[TMP13:%.*]] = add i64 [[TMP5]], [[TMP7]]
; CHECK-NEXT:    [[TMP14:%.*]] = add i64 [[TMP12]], [[TMP13]]
; CHECK-NEXT:    [[TMP15:%.*]] = add i64 [[TMP14]], [[TMP11]]
; CHECK-NEXT:    ret i64 [[TMP15]]
;
  %v00 = insertelement <4 x float> poison, float %f, i32 0
  %v01 = insertelement <4 x float> %v00, float 0.000000e+00, i32 1
  %v02 = insertelement <4 x float> %v01, float 0.000000e+00, i32 2
  %v03 = insertelement <4 x float> %v02, float 0.000000e+00, i32 3
  %tmp0 = tail call i32 @llvm.x86.sse.cvtss2si(<4 x float> %v03)
  %v10 = insertelement <4 x float> poison, float %f, i32 0
  %v11 = insertelement <4 x float> %v10, float 0.000000e+00, i32 1
  %v12 = insertelement <4 x float> %v11, float 0.000000e+00, i32 2
  %v13 = insertelement <4 x float> %v12, float 0.000000e+00, i32 3
  %tmp1 = tail call i64 @llvm.x86.sse.cvtss2si64(<4 x float> %v13)
  %v20 = insertelement <4 x float> poison, float %f, i32 0
  %v21 = insertelement <4 x float> %v20, float 0.000000e+00, i32 1
  %v22 = insertelement <4 x float> %v21, float 0.000000e+00, i32 2
  %v23 = insertelement <4 x float> %v22, float 0.000000e+00, i32 3
  %tmp2 = tail call i32 @llvm.x86.sse.cvttss2si(<4 x float> %v23)
  %v30 = insertelement <4 x float> poison, float %f, i32 0
  %v31 = insertelement <4 x float> %v30, float 0.000000e+00, i32 1
  %v32 = insertelement <4 x float> %v31, float 0.000000e+00, i32 2
  %v33 = insertelement <4 x float> %v32, float 0.000000e+00, i32 3
  %tmp3 = tail call i64 @llvm.x86.sse.cvttss2si64(<4 x float> %v33)
  %v40 = insertelement <2 x double> poison, double %d, i32 0
  %v41 = insertelement <2 x double> %v40, double 0.000000e+00, i32 1
  %tmp4 = tail call i32 @llvm.x86.sse2.cvtsd2si(<2 x double> %v41)
  %v50 = insertelement <2 x double> poison, double %d, i32 0
  %v51 = insertelement <2 x double> %v50, double 0.000000e+00, i32 1
  %tmp5 = tail call i64 @llvm.x86.sse2.cvtsd2si64(<2 x double> %v51)
  %v60 = insertelement <2 x double> poison, double %d, i32 0
  %v61 = insertelement <2 x double> %v60, double 0.000000e+00, i32 1
  %tmp6 = tail call i32 @llvm.x86.sse2.cvttsd2si(<2 x double> %v61)
  %v70 = insertelement <2 x double> poison, double %d, i32 0
  %v71 = insertelement <2 x double> %v70, double 0.000000e+00, i32 1
  %tmp7 = tail call i64 @llvm.x86.sse2.cvttsd2si64(<2 x double> %v71)
  %tmp8 = add i32 %tmp0, %tmp2
  %tmp9 = add i32 %tmp4, %tmp6
  %tmp10 = add i32 %tmp8, %tmp9
  %tmp11 = sext i32 %tmp10 to i64
  %tmp12 = add i64 %tmp1, %tmp3
  %tmp13 = add i64 %tmp5, %tmp7
  %tmp14 = add i64 %tmp12, %tmp13
  %tmp15 = add i64 %tmp11, %tmp14
  ret i64 %tmp15
}

declare <4 x float> @llvm.x86.sse.sub.ss(<4 x float>, <4 x float>)
declare <4 x float> @llvm.x86.sse.mul.ss(<4 x float>, <4 x float>)
declare <4 x float> @llvm.x86.sse.min.ss(<4 x float>, <4 x float>)
declare <4 x float> @llvm.x86.sse.max.ss(<4 x float>, <4 x float>)
declare i32 @llvm.x86.sse.cvtss2si(<4 x float>)
declare i64 @llvm.x86.sse.cvtss2si64(<4 x float>)
declare i32 @llvm.x86.sse.cvttss2si(<4 x float>)
declare i64 @llvm.x86.sse.cvttss2si64(<4 x float>)
declare i32 @llvm.x86.sse2.cvtsd2si(<2 x double>)
declare i64 @llvm.x86.sse2.cvtsd2si64(<2 x double>)
declare i32 @llvm.x86.sse2.cvttsd2si(<2 x double>)
declare i64 @llvm.x86.sse2.cvttsd2si64(<2 x double>)
