//
//  FullView.swift
//  Habits V2
//
//  Created by Justin on 5/28/23.
//

import SwiftUI

struct FullView: View {
    @AppStorage("APP_COLOR") var selection = "Green"
    var body: some View {
        TabView {
            Group {
                ListView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("CheckList")
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gearshape.2.fill")
                    }
            }
        }
        .accentColor(Color(selection))
    }
}

struct Full_View_Previews: PreviewProvider {
    static var previews: some View {
        FullView()
            .environmentObject(ListViewModel())
    }
}
