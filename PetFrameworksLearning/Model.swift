//
//  Model.swift
//  PetFrameworksLearning
//
//  Created by Sergey Borovkov on 18.06.2021.
//

import Foundation
import RealmSwift

extension Collection where Element: Identifiable {
    func firstIndex(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
}

class People: Object, Identifiable {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var isMale: Bool = false
    @objc dynamic var id = UUID()
}
