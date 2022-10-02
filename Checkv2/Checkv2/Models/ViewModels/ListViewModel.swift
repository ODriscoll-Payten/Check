//
//  ListViewModel.swift
//  Checkv2
//
//  Created by Payten O'Driscoll on 9/15/22.
//

import Foundation
import SwiftUI

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject {
    @Published var currentList: ToDoList?
    @Published var animate: Bool = false

    
    @Published var newToDoName: String = ""
    
    @Published var listNavTitle = "Default List"
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(
                        Animation
                            .easeInOut(duration: 2.0)
                            .repeatForever()
                        ) {
                            self.animate.toggle()
            }
        }
    }
    
//    @Published var todoLists: [Page] = [] {
//        didSet {
//            saveItems()
//        }
//    }
//
//    @Published var currentPage: Page {
//        didSet {
//            saveItems()
//        }
//    }
//
//    @Published var items : [ItemModel] = [] {
//        didSet {
//            saveItems()
//        }
//    }
    
//
//    let itemsKey: String = "items_list"
//    let pagesKey: String = "pages_list"
//
////    func getItems() {
////
////
////        guard
////            let data2 = UserDefaults.standard.data(forKey: itemsKey),
////            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data2)
////        else { return }
////        self.items = savedItems
////    }
//
//    func getPages() {
//
//                guard
//                    let data = UserDefaults.standard.data(forKey: pagesKey),
//                    let savedPages = try? JSONDecoder().decode([Page].self, from: data)
//                else { return }
//                self.todoLists = savedPages
//    }
//
//    func moveItem(from: IndexSet, to: Int) {
//        items.move(fromOffsets: from, toOffset: to)
//    }
//
//    func deleteItem(indexSet: IndexSet) {
//        items.remove(atOffsets: indexSet)
//    }
//
//    func addItem(title: String) {
//        let newItem = ItemModel(title: title, isCompleted: false)
//        items.append(newItem)
//    }
//
//    func addList(title: String) {
//        let newList = Page(name: title, tasks: [])
//        todoLists.append(newList)
//    }
//
    func updateToDo(toDo: ToDo){
        if let index = currentList?.toDosArray.firstIndex(where: { $0.id == toDo.id}) {
            currentList?.toDosArray[index].isCompleted = !toDo.isCompleted
        }
    }
//
//    func saveItems() {
////        if let encodedItemsData = try? JSONEncoder().encode(items) {
////            UserDefaults.standard.set(encodedItemsData, forKey: itemsKey)
////        }
//
//        if let encodedPagesData = try? JSONEncoder().encode(todoLists) {
//            UserDefaults.standard.set(encodedPagesData, forKey: pagesKey)
//        }
//
//
//    }
//
////    func setItems() {
////
////        getPages()
////        items = currentPage.tasks
////
////        saveItems()
////    }
//
}
