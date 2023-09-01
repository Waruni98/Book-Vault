//
//  BookvaultApp.swift
//  Bookvault
//
//  Created by waruni on 2023-04-17.
//

import SwiftUI

@main
struct BookvaultApp: App {
    @StateObject private var dataController = DataController()
    
  var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.contaier.viewContext)
        }
      
    }
}
