//
//  Benchmark.swift
//  Demo
//
//  Created by xxxAIRINxxx on 2016/02/20.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public final class Benchmarker {
    
    public static let shared = Benchmarker()
    
    private var benchmarks : [Benchmark] = []
    
    public func start(key: String = #file + #function) {
        let filterd = self.benchmarks.filter({ return $0.key == key }).first
        if filterd == nil {
            self.benchmarks.append(Benchmark(key: key))
        }
    }
    
    public func cancel(key: String = "") {
        self.benchmarks = self.benchmarks.filter() { return $0.key != key }
    }
    
    public func finish(key: String = "") -> String {
        guard let _benchmark = self.benchmarks.filter({ return $0.key == key }).first else {
            return "Benchmarker Error - Not Found"
        }
        
        let string = _benchmark.finish()
        self.cancel(key)
        return string
    }
}

public final class Benchmark {
    
    public let startTime : CFAbsoluteTime
    public let key : String
    
    public convenience init(fileName: String = #file , funcName: String = #function) {
        let _fileName = fileName.componentsSeparatedByString("/").last ?? ""
        let key = _fileName + " " + funcName
        self.init(key: key)
    }
    
    public init(key: String) {
        self.startTime = CFAbsoluteTimeGetCurrent()
        self.key = key
    }
    
    public func finish() -> String {
        let elapsed = (CFAbsoluteTimeGetCurrent() - startTime)
        let formatedElapsed = String(format: "%.5f", elapsed)
        let string = "\(self.key) time : \(formatedElapsed) (second)"
        print(string)
        return self.key
    }
}
