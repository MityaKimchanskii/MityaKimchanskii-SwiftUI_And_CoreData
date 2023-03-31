//
//  Company+CoreDataProperties.swift
//  SwiftUI_And_CoreData
//
//  Created by Mitya Kim on 3/30/23.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var name: String?
    @NSManaged public var emploeeys: NSSet?

}

// MARK: Generated accessors for emploeeys
extension Company {

    @objc(addEmploeeysObject:)
    @NSManaged public func addToEmploeeys(_ value: Employee)

    @objc(removeEmploeeysObject:)
    @NSManaged public func removeFromEmploeeys(_ value: Employee)

    @objc(addEmploeeys:)
    @NSManaged public func addToEmploeeys(_ values: NSSet)

    @objc(removeEmploeeys:)
    @NSManaged public func removeFromEmploeeys(_ values: NSSet)

}

extension Company : Identifiable {

}
