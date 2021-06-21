//
//  ViewModel.swift
//  PetFrameworksLearning
//
//  Created by Sergey Borovkov on 18.06.2021.
//

import Foundation
import RealmSwift

class ViewModel: ObservableObject {
    @Published var peoples: [People] = []
    init() {
        fetcData()
    }
    
    func fetcData(){
        guard let dbRef = try? Realm() else { return }
        let result = dbRef.objects(People.self)
        self.peoples = result.compactMap{ (people) -> People? in
            return people
        }
    }
    
    func addPeople(name: String, age: Int, isMale: Bool){
        
        guard let dbRef = try? Realm() else { return }
        
        let people = People()
        people.name = name
        people.age = age
        people.isMale = isMale
        
        try? dbRef.write{
            dbRef.add(people)
            fetcData()
        }
    }
    
    func deletePeople(people: People){
        
        guard let dbRef = try? Realm() else { return }
    
        try? dbRef.write{
            dbRef.delete(people)
            fetcData()
        }
    }
    
    func editPopleInfo(by id: Int, with name: String, _ age: Int, and isMale: Bool){
        guard let dbRef = try? Realm() else { return }
    
        try? dbRef.write{
            peoples[id].name = name
            peoples[id].age = age
            peoples[id].isMale = isMale
            fetcData()
        }
    }
}
