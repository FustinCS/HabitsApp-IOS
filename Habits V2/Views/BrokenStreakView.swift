//
//  BrokenStreakView.swift
//  Habits V2
//
//  Created by Justin Jue on 5/30/23.
//

import SwiftUI

struct BrokenStreakView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("APP_COLOR") var selection = "Green"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Text("Streak Broken! 😦")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("It looks like your streak has been broken! Make sure to check in everyday and complete your task list in order to build good habits!")
                Button("Continue") {
                    dismiss()
                }
                .bold()
                .foregroundColor(.white)
                .font(.title2)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .background(Color(selection))
                .cornerRadius(10)
                .padding(.horizontal,60)
                .padding([.bottom,.top],10)
                Spacer()
            }
            .multilineTextAlignment(.center)
            .padding(50)
        }
    }
}

struct BrokenStreakView_Previews: PreviewProvider {
    static var previews: some View {
        BrokenStreakView()
    }
}
