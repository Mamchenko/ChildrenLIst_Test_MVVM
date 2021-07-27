//
//  ChildrenListViewModel.swift
//  fff
//
//  Created by Anatoliy Mamchenko on 24.07.2021.
//

protocol ChildrenListViewModel: AnyObject {
    var buttonIsHiden: Bool {get}
    func getChildForRowAt(row: Int) -> Child
    func getChildrenNumber() -> Int
    func getChildren() -> Children
    func addChild(name: String, age: Int)
    func deleteChildforRowAt(row: Int)
}
