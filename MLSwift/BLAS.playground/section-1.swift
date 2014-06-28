// Playground - noun: a place where people can play

import Cocoa
import Accelerate

var f: Double = 1

var cf = CDouble(f)

let m = CInt(3)
let n = CInt(3)
let alpha = CDouble(1)
let beta = CDouble(1)
let lda = CInt(3)
let incX = CInt(1)
let incY = CInt(1)

var x = CDouble[](1...3)

var v = x

var y = CDouble[](count: Int(m), repeatedValue: 0)

x

var a = [0, 0, 0,
         1, 0, 2,
         3, 0, 1].map { (i) in CDouble(i) }

cblas_dgemv(CblasColMajor, CblasNoTrans, m, n, alpha, a, lda, x, incX, beta, &y, incY)

y

var c1: CFloat[] = [2, 7, 1]
var c2: CFloat[] = [1, 2, 3]

cblas_saxpy(n, CFloat(-1), c1, CInt(1), &c2, CInt(1))

c2

var np: __CLPK_integer = 2
    
var a2: __CLPK_doublereal[] = [1,2,3,4]
var a3: CDouble[] = [1,2,3,4]
var ipiv = __CLPK_integer[](count: Int(np), repeatedValue:0)
var lwork = np*np
var work = __CLPK_doublereal[](count: Int(lwork), repeatedValue:0)
var info: CInt = 0

dgetrf_(&np, &np, &a3, &np, &ipiv, &info)
a3
ipiv


dgetri_(&np, &a3, &np, &ipiv, &work, &lwork, &info)
a3

