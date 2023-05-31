//
//  NoItemsView.swift
//  Habits V2
//
//  Created by Justin Jue on 5/28/23.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    Text("There are no tasks!")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("It looks like you don't have anything on your habits checklist right now. Try to add something using the add button!")
                }
            }
            .multilineTextAlignment(.center)
            .padding(50)
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NoItemsView()

    }
}
