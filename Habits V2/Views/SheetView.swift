//
//  SheetView.swift
//  Habits V2
//
//  Created by Justin on 5/27/23.
//

import SwiftUI

struct SheetView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @AppStorage("APP_COLOR") var selection = "Green"
    @EnvironmentObject var listViewModel : ListViewModel
    var textFieldColor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    var body: some View {
        NavigationStack {
            VStack() {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(textFieldColor)
                    .cornerRadius(10)
            }
            .padding()
            .navigationTitle("Add a Task")
            .navigationBarItems (
                leading: Button("Close") {
                    dismiss()
                },
                trailing: Button(action: saveButtonPressed, label: {
                    Text("Save")
                })
            )
            .accentColor(Color(selection))
            Spacer()
        }
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 1 {
            alertTitle = "No task given!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
            SheetView()
    }
}
