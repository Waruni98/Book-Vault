//
//  DataController.swift
//  Bookvault
//
//  Created by waruni on 2023-04-17.
//
import CoreData
import Foundation


class DataController:ObservableObject {
    let contaier = NSPersistentContainer(name: "BookVault")
    
    init() {
        contaier.loadPersistentStores { description, error in if let error = error{
            print("Core data failed to load:\(error.localizedDescription)")
            }
        }
    }
}
