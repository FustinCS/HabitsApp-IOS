//
//  SettingsView.swift
//  Habits V2
//
//  Created by Justin Jue on 5/28/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("APP_COLOR") var selection = "Green"
    let colors = ["Green", "Red", "Blue", "Pink"]
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Picker("Theme Color", selection: $selection) {
                        ForEach(colors,id:\.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(Color(selection))
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
