//
//  Habits_V2App.swift
//  Habits V2
//
//  Created by Justin Jue on 5/27/23.
//

import SwiftUI

@main
struct Habits_V2App: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            FullView()
                .environmentObject(listViewModel)
        }
    }
}
