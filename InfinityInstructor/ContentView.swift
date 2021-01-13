//
//  ContentView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    @State var user : OnlineUser
    @State var showPopUp = false
    @ObservedObject var viewRouter = ViewRouter()
    
    let pub = NotificationCenter.default
    .publisher(for: NSNotification.Name("UpdateFirebase"))
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Spacer()
                    if self.viewRouter.currentView == "home" {
                        HomeView(classes: self.$user.classes)
                    } else if self.viewRouter.currentView == "settings" {
                        SettingsView()
                    }
                    Spacer()
                    ZStack {
                        if self.showPopUp {
                            PlusMenu(classes: self.$user.classes)
                                .offset(y: -geometry.size.height/4)
                        }
                        HStack {
                            Image(systemName: "house")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                                .frame(width: geometry.size.width/3, height: 75)
                                .foregroundColor(self.viewRouter.currentView == "home" ? .black : .gray)
                                .onTapGesture {
                                    self.viewRouter.currentView = "home"
                            }
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.white)
                                    .frame(width: 75, height: 75)
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75, height: 75)
                                    .foregroundColor(.blue)
                            }
                            .rotationEffect(Angle(degrees: self.showPopUp ? 90 : 0))
                            .offset(y: -geometry.size.height/10/2)
                            .onTapGesture {
                                withAnimation {
                                    self.showPopUp.toggle()
                                }
                            }
                            Image(systemName: "gear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                                .frame(width: geometry.size.width/3, height: 75)
                                .foregroundColor(self.viewRouter.currentView == "settings" ? .black : .gray)
                                .onTapGesture {
                                    self.viewRouter.currentView = "settings"
                            }
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/10)
                    .background(Color.white.shadow(radius: 2))
                }
                .edgesIgnoringSafeArea(.bottom)
            
            }
            
        }
        .onReceive(pub) { (output) in
            self.updateFirebase()
        }
    }
    
    func updateFirebase() {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(UserDefaults.standard.value(forKey: "uid") as! String)
        do {
            let data = try JSONEncoder().encode(self.user.classes)
            try docRef.setData(from: self.user) { (error) in
                print(error?.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func addClass() {
        print("class")
    }
    
    func addUnit() {
        print("unit")
    }
    func addSet() {
        print("set")
    }
    func addTest() {
        print("test")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView(user: OnlineUser(name: "Belal", classes: [Constants.studyClass1, Constants.studyClass2]))
    }
}

struct PlusMenu: View {
    @Binding var classes : [Class]
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.blue)
                        .frame(width: 70, height: 70)
                    NavigationLink(destination: AddClassView(name: "", description: "", classes: self.$classes)) {
                        Text("Class")
                            .padding(10)
                            .foregroundColor(.white)
                    }
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.blue)
                        .frame(width: 70, height: 70)
                    NavigationLink(destination: AddUnitView(name: "", description: "", classes: self.$classes)) {
                        Text("Unit")
                            .padding(10)
                            .foregroundColor(classes.isEmpty ? .gray : .white)
                    }.disabled(classes.isEmpty)
                    
                }
                
                
            }
            HStack(spacing: 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.blue)
                        .frame(width: 70, height: 70)
                    NavigationLink(destination: AddSetView(name: "", description: "", classes: self.$classes, array: [])) {
                        Text("Set")
                            .padding(10)
                            .foregroundColor(unitIsEmpty(classes: classes) ? .gray : .white)
                    }.disabled(unitIsEmpty(classes: classes))
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.blue)
                        .frame(width: 70, height: 70)
                    NavigationLink(destination: AddTestView(name: "", description: "", classes: self.$classes)) {
                        Text("Test")
                            .padding(10)
                            .foregroundColor(unitIsEmpty(classes: classes) ? .gray : .white)
                    }.disabled(unitIsEmpty(classes: classes))
                    
                }
            }
            .transition(.scale)
        }
    }
}

func unitIsEmpty(classes: [Class]) -> Bool {
    if classes.isEmpty {
        return true
    }
    var count = 0
    for c in classes {
        if !c.units.isEmpty {
            count = count + 1
        }
    }
    return (count == 0)
}

//func getClassArray(classes: [Class]) -> [Class] {
//    var arr = [Class]()
//    for c in classes {
//        if !c.units.isEmpty {
//            arr.append(c)
//        }
//    }
//    return arr
//}
