//
//  Employee+CoreDataClass.swift
//  SwiftUI_And_CoreData
//
//  Created by Mitya Kim on 3/31/23.
//
//

import Foundation
import CoreData

@objc(Employee)
public class Employee: NSManagedObject, Comparable {
    public static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.name == rhs.name
    }
}
