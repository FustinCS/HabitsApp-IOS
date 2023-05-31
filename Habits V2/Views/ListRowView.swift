//
//  ListRowView.swift
//  Habits V2
//
//  Created by Justin on 5/27/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .overlay {
                    if item.isCompleted {
                        Image(systemName: "checkmark")
                    }
                }
                .padding(.leading,30)
            Text(item.title)
                .padding(.vertical, 6)
            Spacer()
        }
        .contentShape(Rectangle())
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "First Item!", isCompleted: true)
    static var previews: some View {
        ListRowView(item: item1)
    }
}
