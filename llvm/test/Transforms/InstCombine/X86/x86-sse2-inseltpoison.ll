; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -mtriple=x86_64-unknown-unknown -S | FileCheck %s
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define double @test_sqrt_sd_0(double %a) {
; CHECK-LABEL: @test_sqrt_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = call double @llvm.sqrt.f64(double [[A:%.*]])
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = tail call <2 x double> @llvm.x86.sse2.sqrt.sd(<2 x double> %2)
  %4 = extractelement <2 x double> %3, i32 0
  ret double %4
}

define double @test_sqrt_sd_1(double %a) {
; CHECK-LABEL: @test_sqrt_sd_1(
; CHECK-NEXT:    ret double 1.000000e+00
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = tail call <2 x double> @llvm.x86.sse2.sqrt.sd(<2 x double> %2)
  %4 = extractelement <2 x double> %3, i32 1
  ret double %4
}

define double @test_add_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_add_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = fadd double [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.add.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 0
  ret double %6
}

define double @test_add_sd_1(double %a, double %b) {
; CHECK-LABEL: @test_add_sd_1(
; CHECK-NEXT:    ret double 1.000000e+00
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.add.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 1
  ret double %6
}

define double @test_add_sd_2(double %a) {
; CHECK-LABEL: @test_add_sd_2(
; CHECK-NEXT:    [[TMP1:%.*]] = fadd double [[A:%.*]], [[A]]
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = insertelement <2 x double> zeroinitializer, double %a, i32 0
  %2 = tail call <2 x double> @llvm.x86.sse2.add.sd(<2 x double> %1, <2 x double> %1)
  %3 = extractelement <2 x double> %2, i32 0
  ret double %3
}

define double @test_sub_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_sub_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = fsub double [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.sub.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 0
  ret double %6
}

define double @test_sub_sd_1(double %a, double %b) {
; CHECK-LABEL: @test_sub_sd_1(
; CHECK-NEXT:    ret double 1.000000e+00
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.sub.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 1
  ret double %6
}

define double @test_sub_sd_2(double %a) {
; CHECK-LABEL: @test_sub_sd_2(
; CHECK-NEXT:    [[TMP1:%.*]] = fsub double [[A:%.*]], [[A]]
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = insertelement <2 x double> zeroinitializer, double %a, i32 0
  %2 = tail call <2 x double> @llvm.x86.sse2.sub.sd(<2 x double> %1, <2 x double> %1)
  %3 = extractelement <2 x double> %2, i32 0
  ret double %3
}

define double @test_mul_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_mul_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = fmul double [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.mul.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 0
  ret double %6
}

define double @test_mul_sd_1(double %a, double %b) {
; CHECK-LABEL: @test_mul_sd_1(
; CHECK-NEXT:    ret double 1.000000e+00
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.mul.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 1
  ret double %6
}

define double @test_mul_sd_2(double %a) {
; CHECK-LABEL: @test_mul_sd_2(
; CHECK-NEXT:    [[TMP1:%.*]] = fmul double [[A:%.*]], [[A]]
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = insertelement <2 x double> zeroinitializer, double %a, i32 0
  %2 = tail call <2 x double> @llvm.x86.sse2.mul.sd(<2 x double> %1, <2 x double> %1)
  %3 = extractelement <2 x double> %2, i32 0
  ret double %3
}

define double @test_div_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_div_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = fdiv double [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.div.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 0
  ret double %6
}

define double @test_div_sd_1(double %a, double %b) {
; CHECK-LABEL: @test_div_sd_1(
; CHECK-NEXT:    ret double 1.000000e+00
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.div.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 1
  ret double %6
}

define double @test_div_sd_2(double %a) {
; CHECK-LABEL: @test_div_sd_2(
; CHECK-NEXT:    [[TMP1:%.*]] = fdiv double [[A:%.*]], [[A]]
; CHECK-NEXT:    ret double [[TMP1]]
;
  %1 = insertelement <2 x double> zeroinitializer, double %a, i32 0
  %2 = tail call <2 x double> @llvm.x86.sse2.div.sd(<2 x double> %1, <2 x double> %1)
  %3 = extractelement <2 x double> %2, i32 0
  ret double %3
}

define <2 x double> @test_min_sd(<2 x double> %a, <2 x double> %b) {
; CHECK-LABEL: @test_min_sd(
; CHECK-NEXT:    [[TMP1:%.*]] = tail call <2 x double> @llvm.x86.sse2.min.sd(<2 x double> [[A:%.*]], <2 x double> [[B:%.*]])
; CHECK-NEXT:    ret <2 x double> [[TMP1]]
;
  %1 = insertelement <2 x double> %b, double 2.000000e+00, i32 1
  %2 = tail call <2 x double> @llvm.x86.sse2.min.sd(<2 x double> %a, <2 x double> %1)
  ret <2 x double> %2
}

define double @test_min_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_min_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call <2 x double> @llvm.x86.sse2.min.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    [[TMP4:%.*]] = extractelement <2 x double> [[TMP3]], i32 0
; CHECK-NEXT:    ret double [[TMP4]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.min.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 0
  ret double %6
}

define double @test_min_sd_1(double %a, double %b) {
; CHECK-LABEL: @test_min_sd_1(
; CHECK-NEXT:    ret double 1.000000e+00
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.min.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 1
  ret double %6
}

define double @test_min_sd_2(double %a) {
; CHECK-LABEL: @test_min_sd_2(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> <double undef, double 0.000000e+00>, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = tail call <2 x double> @llvm.x86.sse2.min.sd(<2 x double> [[TMP1]], <2 x double> [[TMP1]])
; CHECK-NEXT:    [[TMP3:%.*]] = extractelement <2 x double> [[TMP2]], i32 0
; CHECK-NEXT:    ret double [[TMP3]]
;
  %1 = insertelement <2 x double> zeroinitializer, double %a, i32 0
  %2 = tail call <2 x double> @llvm.x86.sse2.min.sd(<2 x double> %1, <2 x double> %1)
  %3 = extractelement <2 x double> %2, i32 0
  ret double %3
}

define <2 x double> @test_max_sd(<2 x double> %a, <2 x double> %b) {
; CHECK-LABEL: @test_max_sd(
; CHECK-NEXT:    [[TMP1:%.*]] = tail call <2 x double> @llvm.x86.sse2.max.sd(<2 x double> [[A:%.*]], <2 x double> [[B:%.*]])
; CHECK-NEXT:    ret <2 x double> [[TMP1]]
;
  %1 = insertelement <2 x double> %b, double 2.000000e+00, i32 1
  %2 = tail call <2 x double> @llvm.x86.sse2.max.sd(<2 x double> %a, <2 x double> %1)
  ret <2 x double> %2
}

define double @test_max_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_max_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call <2 x double> @llvm.x86.sse2.max.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    [[TMP4:%.*]] = extractelement <2 x double> [[TMP3]], i32 0
; CHECK-NEXT:    ret double [[TMP4]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.max.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 0
  ret double %6
}

define double @test_max_sd_1(double %a, double %b) {
; CHECK-LABEL: @test_max_sd_1(
; CHECK-NEXT:    ret double 1.000000e+00
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.max.sd(<2 x double> %2, <2 x double> %4)
  %6 = extractelement <2 x double> %5, i32 1
  ret double %6
}

define double @test_max_sd_2(double %a) {
; CHECK-LABEL: @test_max_sd_2(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> <double undef, double 0.000000e+00>, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = tail call <2 x double> @llvm.x86.sse2.max.sd(<2 x double> [[TMP1]], <2 x double> [[TMP1]])
; CHECK-NEXT:    [[TMP3:%.*]] = extractelement <2 x double> [[TMP2]], i32 0
; CHECK-NEXT:    ret double [[TMP3]]
;
  %1 = insertelement <2 x double> zeroinitializer, double %a, i32 0
  %2 = tail call <2 x double> @llvm.x86.sse2.max.sd(<2 x double> %1, <2 x double> %1)
  %3 = extractelement <2 x double> %2, i32 0
  ret double %3
}

define <2 x double> @test_cmp_sd(<2 x double> %a, <2 x double> %b) {
; CHECK-LABEL: @test_cmp_sd(
; CHECK-NEXT:    [[TMP1:%.*]] = tail call <2 x double> @llvm.x86.sse2.cmp.sd(<2 x double> [[A:%.*]], <2 x double> [[B:%.*]], i8 0)
; CHECK-NEXT:    ret <2 x double> [[TMP1]]
;
  %1 = insertelement <2 x double> %b, double 2.000000e+00, i32 1
  %2 = tail call <2 x double> @llvm.x86.sse2.cmp.sd(<2 x double> %a, <2 x double> %1, i8 0)
  ret <2 x double> %2
}

define double @test_cmp_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_cmp_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call <2 x double> @llvm.x86.sse2.cmp.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]], i8 0)
; CHECK-NEXT:    [[TMP4:%.*]] = extractelement <2 x double> [[TMP3]], i32 0
; CHECK-NEXT:    ret double [[TMP4]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.cmp.sd(<2 x double> %2, <2 x double> %4, i8 0)
  %6 = extractelement <2 x double> %5, i32 0
  ret double %6
}

define double @test_cmp_sd_1(double %a, double %b) {
; CHECK-LABEL: @test_cmp_sd_1(
; CHECK-NEXT:    ret double 1.000000e+00
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call <2 x double> @llvm.x86.sse2.cmp.sd(<2 x double> %2, <2 x double> %4, i8 0)
  %6 = extractelement <2 x double> %5, i32 1
  ret double %6
}

define double @test_cmp_sd_2(double %a) {
; CHECK-LABEL: @test_cmp_sd_2(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> <double undef, double 0.000000e+00>, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = tail call <2 x double> @llvm.x86.sse2.cmp.sd(<2 x double> [[TMP1]], <2 x double> [[TMP1]], i8 3)
; CHECK-NEXT:    [[TMP3:%.*]] = extractelement <2 x double> [[TMP2]], i32 0
; CHECK-NEXT:    ret double [[TMP3]]
;
  %1 = insertelement <2 x double> zeroinitializer, double %a, i32 0
  %2 = tail call <2 x double> @llvm.x86.sse2.cmp.sd(<2 x double> %1, <2 x double> %1, i8 3)
  %3 = extractelement <2 x double> %2, i32 0
  ret double %3
}

define i32 @test_comieq_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_comieq_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.comieq.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.comieq.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_comige_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_comige_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.comige.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.comige.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_comigt_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_comigt_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.comigt.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.comigt.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_comile_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_comile_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.comile.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.comile.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_comilt_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_comilt_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.comilt.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.comilt.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_comineq_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_comineq_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.comineq.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.comineq.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_ucomieq_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_ucomieq_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.ucomieq.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.ucomieq.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_ucomige_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_ucomige_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.ucomige.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.ucomige.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_ucomigt_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_ucomigt_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.ucomigt.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.ucomigt.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_ucomile_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_ucomile_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.ucomile.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.ucomile.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_ucomilt_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_ucomilt_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.ucomilt.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.ucomilt.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

define i32 @test_ucomineq_sd_0(double %a, double %b) {
; CHECK-LABEL: @test_ucomineq_sd_0(
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> undef, double [[A:%.*]], i32 0
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[B:%.*]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = tail call i32 @llvm.x86.sse2.ucomineq.sd(<2 x double> [[TMP1]], <2 x double> [[TMP2]])
; CHECK-NEXT:    ret i32 [[TMP3]]
;
  %1 = insertelement <2 x double> poison, double %a, i32 0
  %2 = insertelement <2 x double> %1, double 1.000000e+00, i32 1
  %3 = insertelement <2 x double> poison, double %b, i32 0
  %4 = insertelement <2 x double> %3, double 2.000000e+00, i32 1
  %5 = tail call i32 @llvm.x86.sse2.ucomineq.sd(<2 x double> %2, <2 x double> %4)
  ret i32 %5
}

declare <2 x double> @llvm.x86.sse2.sqrt.sd(<2 x double>) nounwind readnone

declare <2 x double> @llvm.x86.sse2.add.sd(<2 x double>, <2 x double>)
declare <2 x double> @llvm.x86.sse2.sub.sd(<2 x double>, <2 x double>)
declare <2 x double> @llvm.x86.sse2.mul.sd(<2 x double>, <2 x double>)
declare <2 x double> @llvm.x86.sse2.div.sd(<2 x double>, <2 x double>)
declare <2 x double> @llvm.x86.sse2.min.sd(<2 x double>, <2 x double>)
declare <2 x double> @llvm.x86.sse2.max.sd(<2 x double>, <2 x double>)
declare <2 x double> @llvm.x86.sse2.cmp.sd(<2 x double>, <2 x double>, i8)

declare i32 @llvm.x86.sse2.comieq.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.comige.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.comigt.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.comile.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.comilt.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.comineq.sd(<2 x double>, <2 x double>)

declare i32 @llvm.x86.sse2.ucomieq.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.ucomige.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.ucomigt.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.ucomile.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.ucomilt.sd(<2 x double>, <2 x double>)
declare i32 @llvm.x86.sse2.ucomineq.sd(<2 x double>, <2 x double>)
