//
//  Model.swift
//  PetFrameworksLearning
//
//  Created by Sergey Borovkov on 18.06.2021.
//

import Foundation

extension Collection where Element: Identifiable {
    func firstIndex(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
}

struct Model {
    var peoples = [people]()
    
    struct people: Identifiable {
        var name: String
        var age: Int
        var isMale: Bool
        var id = UUID()
    }
}
