//
//  LoginView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/27/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

struct LoginView: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var name : String = ""
    @State private var showingAlert = false
    @State private var show_modal: Bool = false
    @State private var pickerIndex : Int = 0
    var body: some View {
        VStack(spacing: 20) {
            Text("Infinity Instructor")
                .font(.largeTitle)
            VStack {
                if self.pickerIndex == 1 {
                    TextField("Name",text:  $name)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
                }
            }
            TextField("Email",text:  $email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            SecureField("Password", text: $password)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
                
                .accentColor(.white)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.blue).frame(width: 100, height: 30, alignment: .center))
            Picker(selection: $pickerIndex, label: Text("Login or SignUp")) {
                ForEach(0..<2) {
                    Text(["Login", "Sign Up"][$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Button(action: {
                if self.pickerIndex == 1 {
                    
                    //Create User
                    Auth.auth().createUser(withEmail: self.email, password: self.password) { (authResult, error) in
                        print("create user")
                        if error != nil {
                            print(error!.localizedDescription)
                            return
                            
                        }
                        //create alert
                        let user = Auth.auth().currentUser
                        if let user = user {
                            let uid = user.uid
                            print(uid)
                            UserDefaults.standard.set(uid, forKey: "uid")
                        }
                        if user != nil && UserDefaults.standard.value(forKey: "uid") != nil {
                            print("open modal")
                            self.show_modal = true
                            //Setup Database
                            let db = Firestore.firestore()
                            let docRef = db.collection("users").document(UserDefaults.standard.value(forKey: "uid") as! String)
                            do {
                                try docRef.setData(from: User(name: self.name, classes: []))
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                } else {
                    print("login with email \(self.email) and password \(self.password)")
                    Auth.auth().signIn(withEmail: self.email, password: self.password) { [self] authResult, error in
                        guard let error = error else {return}
                        print(error.localizedDescription)
                        //create alert
                    }
                    let user = Auth.auth().currentUser
                    if let user = user {
                        let uid = user.uid
                        print(uid)
                        UserDefaults.standard.set(uid, forKey: "uid")
                    }
                }
            }) {
                Text(self.pickerIndex == 1 ? "Sign Up" : "Login")
                    .accentColor(.white)
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.blue).frame(width: 100, height: 30, alignment: .center))
            }
            .accentColor(Color(red: 0.26, green: 0.28, blue: 0.45, opacity: 1.0))
            
            
        }
        .padding(.all)
        
        
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
