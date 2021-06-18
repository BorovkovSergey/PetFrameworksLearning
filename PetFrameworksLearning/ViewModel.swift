//
//  ViewModel.swift
//  PetFrameworksLearning
//
//  Created by Sergey Borovkov on 18.06.2021.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var model: Model
    
    init() {
        model = Model()
    }
    
    func addPeople(name: String, age: Int, isMale: Bool){
        model.peoples.append(Model.people(name: name, age: age, isMale: isMale))
    }
    
    func editPopleInfo(by id: Int, with name: String, _ age: Int, and isMale: Bool){
        model.peoples[id].name = name
        model.peoples[id].age = age
        model.peoples[id].isMale = isMale
    }
}
