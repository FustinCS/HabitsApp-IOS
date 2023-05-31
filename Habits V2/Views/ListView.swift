//
//  ListView.swift
//  Habits V2
//
//  Created by Justin Jue on 5/27/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var toggleSheet: Bool = false
    @State var toggleValidStreak: Bool = false
    @State var toggleBrokenStreak: Bool = false
    @State private var editMode = EditMode.inactive
    @AppStorage("APP_COLOR") var selection = "Green"
    @AppStorage("STREAK_KEY") var savedStreak = 0
    @AppStorage("STREAK_DATE") var savedStreakDate: String?
    var backgroundcolor = Color(#colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1))
    
    var body: some View {
        NavigationStack {
            VStack {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                }
                else {
                    Text("Current Streak: \(savedStreak) 🔥").bold()
                        .foregroundColor(.white)
                        .font(.title2)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color(selection))
                        .cornerRadius(10)
                        .padding(.horizontal,60)
                        .padding([.bottom,.top],10)
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.1)) {
                                        listViewModel.updateItem(item:item)
                                    }
                                }
                                .scaleEffect(item.isCompleted ? 1.2 : 1.0)
                                .animation(.linear(duration: 1), value: item.isCompleted ? 1.2 : 1.0)
                                .listRowBackground(item.isCompleted ? Color("Completed" + selection) : Color.white)
                        }
                        .onDelete(perform:listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Your Tasks")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button("Add") {
                    toggleSheet.toggle()
                })
            .accentColor(Color(selection))
            .environment(\.editMode, $editMode)
            .onAppear(perform: streakNumber)
            .sheet(isPresented: $toggleSheet) {
                SheetView()
            }
            .sheet(isPresented: $toggleValidStreak) {
                ValidStreakView()
            }
            .sheet(isPresented: $toggleBrokenStreak) {
                BrokenStreakView()
            }
            .background(backgroundcolor)
        }
    }
    
    func streakNumber() {
        let currentDate: String = Date.now.formatted(date: .long, time: .omitted)
        let allChecked = checkCompletion(item: listViewModel.items)
        
        if savedStreakDate == nil {
            savedStreakDate = currentDate
        }
        else if savedStreakDate == currentDate {
            if allChecked {
                savedStreak += 1
                savedStreakDate = currentDate
                turnAllFalse(item: &listViewModel.items)
                toggleValidStreak.toggle()
            }
            else {
                savedStreak = 0
                savedStreakDate = currentDate
                turnAllFalse(item: &listViewModel.items)
                toggleBrokenStreak.toggle()
            }

        }
        else if savedStreakDate != currentDate {
            
        }
    }
    
    func checkCompletion(item: [ItemModel]) -> Bool {
        if item.isEmpty {
            return false
        }
        else {
            return item.allSatisfy { $0.isCompleted }
        }
    }
    
    func turnAllFalse(item: inout[ItemModel]) {
        for index in item.indices {
            item[index].isCompleted = false
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(ListViewModel())
    }
}
