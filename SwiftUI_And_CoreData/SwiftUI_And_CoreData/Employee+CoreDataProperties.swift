//
//  Employee+CoreDataProperties.swift
//  SwiftUI_And_CoreData
//
//  Created by Mitya Kim on 3/30/23.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var company: Company?

}

extension Employee : Identifiable {

}
