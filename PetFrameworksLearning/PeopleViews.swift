//
//  PeopleViews.swift
//  PetFrameworksLearning
//
//  Created by Sergey Borovkov on 18.06.2021.
//

import SwiftUI

struct PeopleView: View {
    @Binding var name: String
    @Binding var age: Int
    @Binding var isMale: Bool
    
    var body: some View {
        VStack{
            TextField("Name", text: $name)
            Picker("Age", selection: $age){
                ForEach(0 ..< 100){
                    Text("\($0)")
                }
            }
            Toggle("Is male?", isOn: $isMale)
        }
    }
}

struct PeopleAdd: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var name: String = ""
    @State var age: Int = 0
    @State var isMale: Bool = false
    
    @Binding var isShowing: Bool
    var body: some View {
        PeopleView(name: $name, age: $age, isMale: $isMale)
        Button("Save"){
            self.isShowing = false
            viewModel.addPeople(name: name, age: age, isMale: isMale)
        }
    }
}

struct PeopleEdit: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: ViewModel
    var id: Int
    @State var name: String
    @State var age: Int
    @State var isMale: Bool
    
    var body: some View {
        PeopleView(name: $name, age: $age, isMale: $isMale)
        Button("Done"){
            self.presentationMode.wrappedValue.dismiss()
            viewModel.editPopleInfo(by: id, with: name, age, and: isMale)
        }
    }
}
