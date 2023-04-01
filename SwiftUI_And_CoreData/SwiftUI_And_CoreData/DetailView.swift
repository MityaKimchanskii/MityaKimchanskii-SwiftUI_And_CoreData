//
//  DetailView.swift
//  SwiftUI_And_CoreData
//
//  Created by Mitya Kim on 3/31/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject var company: Company
    @State private var employeeName: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Employee name", text: $employeeName)
                    .textFieldStyle(.roundedBorder)
                Button(action: addEmployee) {
                    Label("", systemImage: "plus")
                }
            }.padding()
            
            List {
                ForEach(company.employeesArray) { employee in
                    Text(employee.name ?? "")
                }.onDelete(perform: deleteEmployee)
             }
        }
    }
    
    private func addEmployee() {
        withAnimation {
            let newEmployee = Employee(context: viewContext)
            newEmployee.name = employeeName
            
            company.addToEmployees(newEmployee)
            PersistenceController.shared.saveContext()
        }
    }
    
    private func deleteEmployee(at offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                let employee = company.employeesArray[index]
                viewContext.delete(employee)
                PersistenceController.shared.saveContext()
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let newCompany = Company(context: viewContext)
        newCompany.name = "Apple"

        let employee1 = Employee(context: viewContext)
        employee1.name = "Jobs"

        let employee2 = Employee(context: viewContext)
        employee2.name = "Woz"

        return DetailView(company: newCompany)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        
    }
}
