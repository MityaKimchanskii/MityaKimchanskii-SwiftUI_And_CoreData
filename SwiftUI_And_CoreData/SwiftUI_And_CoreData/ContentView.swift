//
//  ContentView.swift
//  SwiftUI_And_CoreData
//
//  Created by Mitya Kim on 3/31/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var companyName: String = ""
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Company.name, ascending: true)], animation: .default)
    private var companies: FetchedResults<Company>
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Company name", text: $companyName)
                        .textFieldStyle(.roundedBorder)
                    Button(action: addCompany) {
                        Label("", systemImage: "plus")
                    }
                }.padding()
                List {
                    ForEach(companies) { company in
                        
//                        Text(company.name ?? "")
                        
//                        NavigationLink(destination: UpdateView(company: company)) {
//                            Text(company.name ?? "")
//                        }
                        NavigationLink(destination: DetailView(company: company)) {
                            Text(company.name ?? "")
                        }
                        
                    }.onDelete(perform: deleteCompany)
                }.toolbar { EditButton() }
            }.navigationTitle("Companies")
        }
    }
    
    private func deleteCompany(offsets: IndexSet) {
        withAnimation {
            offsets.map { companies[$0] }.forEach(viewContext.delete)
            PersistenceController.shared.saveContext()
        }
    }
    
    private func addCompany() {
        withAnimation {
            let newCompany = Company(context: viewContext)
            newCompany.name = companyName
            PersistenceController.shared.saveContext()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.viewContext)
    }
}
