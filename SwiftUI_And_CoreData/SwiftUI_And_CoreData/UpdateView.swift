//
//  CompanyDetail.swift
//  SwiftUI_And_CoreData
//
//  Created by Mitya Kim on 3/30/23.
//

import SwiftUI

struct UpdateView: View {
    
    @StateObject var company: Company
    
    @State private var companyName: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Update company name", text: $companyName)
                    .textFieldStyle(.roundedBorder)
                Button(action: updateCompany) {
                    Label("", systemImage: "arrowshape.turn.up.left")
                }
            }.padding()
            Text(company.name ?? "")
            Spacer()
        }
    }
    
    private func updateCompany() {
        withAnimation {
            company.name = companyName
            PersistenceController.shared.saveContext()
        }
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let newCompany = Company(context: viewContext)
        newCompany.name = "iOS Developer"
        
        return UpdateView(company: newCompany)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
