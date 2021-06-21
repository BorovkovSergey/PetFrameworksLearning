//
//  ContentView.swift
//  PetFrameworksLearning
//
//  Created by Sergey Borovkov on 18.06.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @State var ShowPeopleView = false
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.peoples) { people in
                    if let id = viewModel.peoples.firstIndex(matching: people) {
                        NavigationLink(destination: PeopleEdit(id: id,
                                                               name: viewModel.peoples[id].name,
                                                               age: viewModel.peoples[id].age,
                                                               isMale: viewModel.peoples[id].isMale
                                                            )
                                                            .environmentObject(viewModel)
                                                            .navigationBarTitle("Info:")){
                                                                Text(people.name)
                                                            }
                    }
                }
                .onDelete{ indexSet in
                    self.viewModel.deletePeople(people: self.viewModel.peoples[indexSet.first!])
                }
            }
            .navigationBarItems(leading: Button(action: { ShowPeopleView = true }, label: {
                Image(systemName: "plus")
            }))
            .navigationBarTitle("Peoples list:")
            
        }
        .sheet(isPresented: $ShowPeopleView, content: {
            PeopleAdd(isShowing: $ShowPeopleView)
                .environmentObject(viewModel)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
