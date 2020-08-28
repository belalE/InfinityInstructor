//
//  ContentView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var classes : [Class]
    @State var showPopUp = false
    @ObservedObject var viewRouter = ViewRouter()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Spacer()
                    if self.viewRouter.currentView == "home" {
                        HomeView(classes: self.classes)
                    } else if self.viewRouter.currentView == "settings" {
                        SettingsView()
                    }
                    Spacer()
                    ZStack {
                        if self.showPopUp {
                            PlusMenu(classes: self.$classes)
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
        return ContentView(classes: [Constants.studyClass1, Constants.studyClass2])
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
                    NavigationLink(destination: AddClassView(name: "", description: "", classes: self.classes)) {
                        Text("Class")
                            .padding(10)
                            .foregroundColor(.white)
                    }
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.blue)
                        .frame(width: 70, height: 70)
                    NavigationLink(destination: AddUnitView(name: "", description: "", classes: self.classes)) {
                        Text("Unit")
                            .padding(10)
                            .foregroundColor(.white)
                    }
                    
                }
                
                
            }
            HStack(spacing: 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.blue)
                        .frame(width: 70, height: 70)
                    NavigationLink(destination: AddSetView(name: "", description: "", classes: self.classes, array: [])) {
                        Text("Set")
                            .padding(10)
                            .foregroundColor(.white)
                    }
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.blue)
                        .frame(width: 70, height: 70)
                    NavigationLink(destination: AddTestView(name: "", description: "", classes: self.classes)) {
                        Text("Test")
                            .padding(10)
                            .foregroundColor(.white)
                    }
                    
                }
            }
            .transition(.scale)
        }
    }
}
