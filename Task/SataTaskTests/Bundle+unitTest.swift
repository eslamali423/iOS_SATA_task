//
//  Bundle+unitTest.swift
//  SataTaskTests
//
//  Created by Eslam Ali  on 11/06/2022.
//

import Foundation

extension Bundle {
    public class var unitTest: Bundle{
        return Bundle(for: HomeTests.self)
    }
}
