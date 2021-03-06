//
//  ContactAdd.swift
//  AlphaSAPRApp
//
//  Created by Alex Hernandez on 3/23/21.
//


import SwiftUI

struct ContactAdd: View {
    @State private var name: String = ""
    @State private var number: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Image(systemName: "person.fill")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 36.0, height: 39.0)
                Spacer()
            }
            Text("Contact Name:")
                .font(.largeTitle)
            TextField("John Doe", text: $name)
                .padding(.leading)
            Text("Contact Number:")
                .font(.largeTitle)
            TextField("(123) 456-7890", text: $number)
                .padding(.leading)
            HStack{
                Spacer()
                Button(action: {
                    //Update
                    if(name != "" && number != "") {
                        if let data = UserDefaults.standard.data(forKey: "contact") {
                            do {
                                let decoder = JSONDecoder()
                                
                                var contacts = try decoder.decode([Contact].self, from: data)
                                let newContact = Contact(id: (contacts.count), phoneNumber: number, name: name, isInactive: false)
                                contacts.append(newContact)
                                do {
                                    let encoder = JSONEncoder()
                                    
                                    let data = try encoder.encode(contacts)
                                    UserDefaults.standard.set(data, forKey: "contact")
                                } catch {
                                    print("error")
                                }
                            } catch {
                                print("decode error")
                            }
                        }
                        else {
                            do {
                                let encoder = JSONEncoder()
                                let newContact = Contact(id: 0, phoneNumber: number, name: name, isInactive: false)
                                let contacts = [newContact]

                                let data = try encoder.encode(contacts)
                                UserDefaults.standard.set(data, forKey: "contact")
                            } catch {
                                print("error")
                            }
                        }
                    }
                }, label: {
                    Text("Add")
                })
                Spacer()
            }
            .padding(.top)
            
        }
        .padding(.trailing)
    }
}

//struct ContactAdd_Previews: PreviewProvider {
//    static var modelData = ModelData()
//    
//    static var previews: some View {
//        ContactAdd()
//            .environmentObject(modelData)
//    }
//}
