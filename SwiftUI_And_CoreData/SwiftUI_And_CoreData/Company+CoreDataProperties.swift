//
//  Company+CoreDataProperties.swift
//  SwiftUI_And_CoreData
//
//  Created by Mitya Kim on 3/31/23.
//
//

import Foundation
import CoreData


extension Company {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var employees: NSSet?
    
    //    public var unwrappedName: String {
    //        name ?? "Unknown name"
    //    }
    
    public var employeesArray: [Employee] {
        let employeeSet = employees as? Set<Employee> ?? []
        
    //        return employeeSet.sorted {
    //            $0.unwrappedName < $1.unwrappedName
    //        }
        return Array(employeeSet).sorted()
    }
}

// MARK: Generated accessors for employees
extension Company {
    
    @objc(addEmployeesObject:)
    @NSManaged public func addToEmployees(_ value: Employee)
    
    @objc(removeEmployeesObject:)
    @NSManaged public func removeFromEmployees(_ value: Employee)
    
    @objc(addEmployees:)
    @NSManaged public func addToEmployees(_ values: NSSet)
    
    @objc(removeEmployees:)
    @NSManaged public func removeFromEmployees(_ values: NSSet)
    
}

extension Company : Identifiable {
    
}
