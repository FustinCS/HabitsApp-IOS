//
//  ValidStreakView.swift
//  Habits V2
//
//  Created by Justin Jue on 5/30/23.
//

import SwiftUI

struct ValidStreakView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("APP_COLOR") var selection = "Green"
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Text("Streak Continued! 🥳")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Congratuations for keeping your streak alive! Keep on building good habits by checking in everyday and completing your task list! ")
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

struct ValidStreakView_Previews: PreviewProvider {
    static var previews: some View {
        ValidStreakView()
    }
}
