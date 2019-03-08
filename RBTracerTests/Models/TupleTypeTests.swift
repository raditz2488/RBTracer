//
//  TupleTypeTests.swift
//  RBTracerTests
//
//  Created by Rohan Bhale on 06/03/19.
//  Copyright © 2019 Rohan Bhale. All rights reserved.
//

import XCTest
@testable import RBTracer

class TupleTypeTests: XCTestCase {
    
    func test_Tuple() {
        assert_TupleWithValues(4.3, -4.2, 3.1, 1.0)
        assert_TupleWithValues(1.0, 2.0, 3.0, 0.0)
    }
    
    func assert_TupleWithValues(_ x: Double, _ y: Double,  _ z: Double, _ w: Double) {
        let a: Tuple = tuple(x, y, z, w)
        XCTAssertEqual(a.x, x)
        XCTAssertEqual(a.y, y)
        XCTAssertEqual(a.z, z)
        XCTAssertEqual(a.w, w)
    }
    
    func test_PointTuple() {
        let pointTuple = tuple(4.3, -4.2, 3.1, 1.0)
        
        XCTAssertTrue(tupleIsPoint(pointTuple))
        XCTAssertFalse(tupleIsVector(pointTuple))
    }
    
    func test_VectorTuple() {
        let vectorTuple: Tuple = tuple(4.3, -4.2, 3.1, 0.0)
        
        XCTAssertTrue(tupleIsVector(vectorTuple))
        XCTAssertFalse(tupleIsPoint(vectorTuple))
    }
    
    func test_Point_Returns_Tuple() {
        assert_Point_Returns_Tuple(4.3, -4.2, 3.1)
        assert_Point_Returns_Tuple(-4.3, 4.2, -3.1)
    }
    
    func assert_Point_Returns_Tuple(_ x: Double, _ y: Double, _ z: Double) {
        let a: Tuple = point(x, y, z)
        
        XCTAssertEqual(a.x, x)
        XCTAssertEqual(a.y, y)
        XCTAssertEqual(a.z, z)
        XCTAssertEqual(a.w, 1.0)
    }
    
    func test_Vector_Returns_Tuple() {
        assert_Vector_Returns_Tuple(4.3, -4.2, 3.1)
        assert_Vector_Returns_Tuple(-4.3, 4.2, -3.1)
    }
    
    func assert_Vector_Returns_Tuple(_ x: Double, _ y: Double, _ z: Double) {
        let a: Tuple = vector(x, y, z)
        
        XCTAssertEqual(a.x, x)
        XCTAssertEqual(a.y, y)
        XCTAssertEqual(a.z, z)
        XCTAssertEqual(a.w, 0.0)
    }
    
    func test_Equality_Of_DoubleValues() {
        let a = 4.3
        var b = 4.30011
        
        XCTAssertGreaterThanOrEqual(abs(a - b), EPSILON)
        XCTAssertFalse(equal(a, b))
        
        b = 4.2998
        
        XCTAssertGreaterThanOrEqual(abs(a - b), EPSILON)
        XCTAssertFalse(equal(a, b))
        
        b = 4.3001
        XCTAssertLessThan(abs(a - b), EPSILON)
        XCTAssertTrue(equal(a, b))
        
        b = 4.2999
        XCTAssertLessThan(abs(a - b), EPSILON)
        XCTAssertTrue(equal(a, b))
    }
    
    func test_Equality_Of_Tuple_For_X() {
        let a: Tuple = (4.3, 0.0, 0.0, 0.0)
        var b: Tuple = (4.30011, 0.0, 0.0, 0.0)
        
        XCTAssertGreaterThanOrEqual(abs(a.x - b.x), EPSILON)
        XCTAssertFalse(equal(a, b))
        
        b = (4.2998, 0.0, 0.0, 0.0)
        XCTAssertGreaterThanOrEqual(abs(a.x - b.x), EPSILON)
        XCTAssertFalse(equal(a, b))
        
        b = (4.3001, 0.0, 0.0, 0.0)
        XCTAssertLessThan(abs(a.x - b.x), EPSILON)
        XCTAssertTrue(equal(a, b))

        b = (4.2999, 0.0, 0.0, 0.0)
        XCTAssertLessThan(abs(a.x - b.x), EPSILON)
        XCTAssertTrue(equal(a, b))

    }
    
    func test_Equality_Of_Tuple_For_Y() {
        let a: Tuple = (0.0, 4.3, 0.0, 0.0)
        var b: Tuple = (0.0, 4.30011, 0.0, 0.0)
        
        XCTAssertGreaterThanOrEqual(abs(a.y - b.y), EPSILON)
        XCTAssertFalse(equal(a, b))
        
        b = (0.0, 4.2998, 0.0, 0.0)
        XCTAssertGreaterThanOrEqual(abs(a.y - b.y), EPSILON)
        XCTAssertFalse(equal(a, b))

        b = (0.0, 4.3001, 0.0, 0.0)
        XCTAssertLessThan(abs(a.y - b.y), EPSILON)
        XCTAssertTrue(equal(a, b))

        b = (0.0, 4.2999, 0.0, 0.0)
        XCTAssertLessThan(abs(a.y - b.y), EPSILON)
        XCTAssertTrue(equal(a, b))
    }
    
    func test_Equality_Of_Tuple_For_Z() {
        let a: Tuple = (0.0, 0.0, 4.3, 0.0)
        var b: Tuple = (0.0, 0.0, 4.30011, 0.0)
        
        XCTAssertGreaterThanOrEqual(abs(a.z - b.z), EPSILON)
        XCTAssertFalse(equal(a, b))
        
        b = (0.0, 0.0, 4.2998, 0.0)
        XCTAssertGreaterThanOrEqual(abs(a.z - b.z), EPSILON)
        XCTAssertFalse(equal(a, b))

        b = (0.0, 0.0, 4.3001, 0.0)
        XCTAssertLessThan(abs(a.z - b.z), EPSILON)
        XCTAssertTrue(equal(a, b))

        b = (0.0, 0.0, 4.2999, 0.0)
        XCTAssertLessThan(abs(a.z - b.z), EPSILON)
        XCTAssertTrue(equal(a, b))
    }
    
    func test_Equality_Of_Tuple_For_W() {
        let a: Tuple = (0.0, 0.0, 0.0, 4.3)
        var b: Tuple = (0.0, 0.0, 0.0, 4.30011)
        
        XCTAssertGreaterThanOrEqual(abs(a.w - b.w), EPSILON)
        XCTAssertFalse(equal(a, b))
        
        b = (0.0, 0.0, 0.0, 4.2998)
        XCTAssertGreaterThanOrEqual(abs(a.w - b.w), EPSILON)
        XCTAssertFalse(equal(a, b))

        b = (0.0, 0.0, 0.0, 4.3001)
        XCTAssertLessThan(abs(a.w - b.w), EPSILON)
        XCTAssertTrue(equal(a, b))

        b = (0.0, 0.0, 0.0, 4.2999)
        XCTAssertLessThan(abs(a.w - b.w), EPSILON)
        XCTAssertTrue(equal(a, b))
    }
}
