//
//  Tuple.swift
//  RBTracer
//
//  Created by Rohan Bhale on 06/03/19.
//  Copyright © 2019 Rohan Bhale. All rights reserved.
//

import Foundation

let EPSILON = 0.0001

typealias Tuple = (x: Double, y: Double, z: Double, w: Double)

func tuple(_ x: Double, _ y: Double, _ z: Double, _ w: Double) -> Tuple {
    return (x, y, z, w)
}

func tupleIsPoint(_ tuple: Tuple) -> Bool {
    return tuple.w == 1.0
}

func tupleIsVector(_ tuple: Tuple) -> Bool {
    return tuple.w == 0.0
}

func point(_ x: Double, _ y: Double, _ z: Double) -> Tuple {
    return (x, y, z, 1.0)
}

func vector(_ x: Double, _ y: Double, _ z: Double) -> Tuple {
    return (x, y, z, 0.0)
}

func equal(_ a: Double, _ b: Double) -> Bool {
    return abs(a - b) < EPSILON
}

func equal(_ a: Tuple, _ b: Tuple) -> Bool {
    return equal(a.x, b.x) &&
        equal(a.y, b.y) &&
        equal(a.z, b.z) &&
        equal(a.w, b.w)
}
