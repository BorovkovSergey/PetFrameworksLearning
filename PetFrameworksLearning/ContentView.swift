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
                ForEach(viewModel.model.peoples) { people in
                    if let id = viewModel.model.peoples.firstIndex(matching: people) {
                        NavigationLink(destination: PeopleEdit(viewModel: viewModel,
                                                               id: id,
                                                               name: viewModel.model.peoples[id].name,
                                                               age: viewModel.model.peoples[id].age,
                                                               isMale: viewModel.model.peoples[id].isMale
                                                            )
                                                            .navigationBarTitle("Info:")){
                                                                Text(people.name)
                                                            }
                    }
                }
                .onDelete{ indexSet in
                    self.viewModel.model.peoples.remove(at: indexSet.first!)
                }
            }
            .navigationBarItems(leading: Button(action: { ShowPeopleView = true }, label: {
                Image(systemName: "plus")
            }))
            .navigationBarTitle("Peoples list:")
            
        }
        .sheet(isPresented: $ShowPeopleView, content: {
            PeopleAdd(viewModel: viewModel, isShowing: $ShowPeopleView)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
