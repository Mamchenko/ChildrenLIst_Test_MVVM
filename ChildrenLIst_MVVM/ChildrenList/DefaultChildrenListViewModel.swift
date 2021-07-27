//
//  DefaultChildrenListViewModel.swift
//  fff
//
//  Created by Anatoliy Mamchenko on 24.07.2021.
//


class DefaultChildrenListViewModel {
    
    // MARK: - Private
    private let maxChildrenCount = 5
    var children: Children = []
    
}

extension DefaultChildrenListViewModel: ChildrenListViewModel {
    var buttonIsHiden: Bool {
        children.count < maxChildrenCount
    }
    
    func deleteChildforRowAt(row: Int) {
        children.remove(at: row)
        
    }
    
    func getChildForRowAt(row: Int) -> Child {
        children[row]
    }
    
    
    func getChildrenNumber() -> Int {
        
        children.count
    }
    
    func getChildren() -> Children {
        children
    }
    
    func addChild(name: String, age: Int) {
        guard children.count < maxChildrenCount else { return }
        let child = Child(name: name, age: age)
        children.append(child)
    }
}


