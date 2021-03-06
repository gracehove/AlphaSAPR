//
//  ContactRow.swift
//  AlphaSAPRApp
//
//  Created by Alex Hernandez on 3/23/21.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text(contact.name)
            Spacer()
            Text(contact.phoneNumber)
        }
    }
}

//struct ContactRow_Previews: PreviewProvider {
//    static var myContacts = ModelData().myContacts
//    
//    static var previews: some View {
//        ContactRow(contact: myContacts[1])
//            .previewLayout(.fixed(width: 300, height: 40))
//    }
//}

