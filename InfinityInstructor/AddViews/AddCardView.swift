//
//  AddCardView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AddCardView: View {
    @State var cardType : CardType
    @Binding var array : [Card]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15).padding().foregroundColor(.blue)
            VStack<AnyView> {
                if self.cardType == .regular {
                    
                    return AnyView(VStack(spacing: 20) {
                        CardTypeView(cardType: self.$cardType)
                        AddRegularCardView(front: "", back: "", array: self.$array)
                    })
                } else if cardType == .multipleChoice {
                    return AnyView(VStack(spacing: 20) {
                        CardTypeView(cardType: self.$cardType)
                        AddMCCardView(front: "", correct: "", incorrect1: "", incorrect2: "", incorrect3: "", array: self.$array)
                    })
                } else if cardType == .bulleted {
                    return AnyView(VStack(spacing: 20) {
                        CardTypeView(cardType: self.$cardType)
                        AddBulletedCardView(front: "", bullets: [], array: self.$array)
                    })
                } else if cardType == .numbered {
                    return AnyView(VStack(spacing: 20) {
                        CardTypeView(cardType: self.$cardType)
                        AddNumberedCardView(front: "", list: [], array: self.$array)
                    })
                } else if cardType == .acronym {
                    return AnyView(VStack(spacing: 20) {
                        CardTypeView(cardType: self.$cardType)
                        AddAcronymCardView(front: "", meaning: [], array: self.$array)
                    })
                }
                return AnyView(VStack(spacing: 20) {
                    CardTypeView(cardType: self.$cardType)
                    AddImageCardView(front: "", array: self.$array)
                })
            }
        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCardView(cardType: .regular, array: .constant([]))
    }
}

struct AddRegularCardView: View {
    @State var front : String
    @State var back : String
    @Binding var array : [Card]
    
    let pub = NotificationCenter.default
        .publisher(for: NSNotification.Name("Save"))
    
    func save() {
        let card = RegularCard(id: 0, front: self.front, score: 0, back: self.back)
        self.array.append(card)
    }
    var body: some View {
        VStack {
            TextField("Front", text: $front)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
                .foregroundColor(.white)
            TextField("Back", text: $front)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
        }
        .onReceive(pub) { (output) in
            self.save()
        }
        .padding(.horizontal, 25.0)
    }
}

struct AddMCCardView: View {
    @State var front : String
    @State var correct : String
    @State var incorrect1 : String
    @State var incorrect2 : String
    @State var incorrect3 : String
    @Binding var array : [Card]
    
    let pub = NotificationCenter.default
        .publisher(for: NSNotification.Name("Save"))
    
    func save() {
        let card = MultipleChoiceCard(id: 0, front: self.front, score: 0, cardType: .multipleChoice, correct: self.correct, incorrectOptions: [self.incorrect1, self.incorrect2, self.incorrect3])
        self.array.append(card)
    }
    
    var body: some View {
        VStack {
            TextField("Front", text: $front)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            TextField("Correct Answer", text: $correct)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            TextField("Incorrect 1", text: self.$incorrect1)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            TextField("Incorrect 2", text: self.$incorrect2)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            TextField("Incorrect 3", text: self.$incorrect3)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
        }
        .onReceive(pub) { (output) in
            self.save()
        }
        .padding(.horizontal, 25.0)
    }
}

struct AddBulletedCardView: View {
    @State var front : String
    @State var count : Int = 0
    @State var bullets : [String]
    @Binding var array : [Card]
    
    let pub = NotificationCenter.default
        .publisher(for: NSNotification.Name("Save"))
    
    func save() {
        let card = BulletedCard(id: 0, front: self.front, score: 0, bullets: self.bullets)
        self.array.append(card)
    }
    var body: some View {
        VStack {
            TextField("Front", text: $front)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            Stepper(String(bullets.count), onIncrement: {
                self.bullets.append("")
            }, onDecrement: {
                self.bullets.removeLast()
            })
            ForEach(self.bullets, id: \.self) { str in
                TextField("Add", text: .constant(str))
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
            }
        }
        .onReceive(pub) { (output) in
            self.save()
        }
        .padding(.horizontal, 25.0)
    }
}

struct AddAcronymCardView: View {
    @State var front : String
    @State var meaning : [String]
    @Binding var array : [Card]
    
    let pub = NotificationCenter.default
        .publisher(for: NSNotification.Name("Save"))
    
    func save() {
        let card = AcronymCard(id: 0, front: self.front, score: 0, meaning: self.meaning)
        self.array.append(card)
    }
    
    var body: some View {
        VStack {
            TextField("Front", text: self.$front, onEditingChanged: { (changed) in
                if (self.front.count > self.meaning.count) {
                    self.meaning.append("")
                }
            }, onCommit: {
                print("commit")
            })
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            ForEach(self.meaning, id: \.self) { str in
                TextField("Add", text: .constant(str))
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
            }
        }
        .onReceive(pub) { (output) in
            self.save()
        }
        .padding(.horizontal, 25.0)
    }
}

struct AddNumberedCardView: View {
    @State var front : String
    @State var count : Int = 1
    @State var list : [String]
    @Binding var array : [Card]
    
    let pub = NotificationCenter.default
        .publisher(for: NSNotification.Name("Save"))
    
    func save() {
        let card = NumberedCard(id: 0, front: self.front, score: 0, list: self.list)
        self.array.append(card)
    }
    
    var body: some View {
        VStack {
            TextField("Front", text: $front)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            Stepper(String(self.list.count), onIncrement: {
                self.list.append("")
            }, onDecrement: {
                self.list.removeLast()
            })
            ForEach(self.list, id: \.self) { str in
                TextField("Add", text: .constant(str))
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white))
            }
        }
        .onReceive(pub) { (output) in
            self.save()
        }
        .padding(.horizontal, 25.0)
    }
}


struct AddImageCardView: View {
    @State var front : String
    @State private var image : UIImage?
    @State private var isShowPhotoLibrary = false
    @State private var isShowCamera = false
    @Binding var array : [Card]
    @State private var showAlert  : Bool = false
    
    let pub = NotificationCenter.default
        .publisher(for: NSNotification.Name("Save"))
    
    func save() {
        if self.image != nil {
            let card = ImageCard(id: 0, front: self.front, score: 0, image: self.image!)
            self.array.append(card)
        } else {
            self.showAlert.toggle()
        }
    }
    
    var body: some View {
        VStack {
            TextField("Front", text: $front)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            HStack {
                Button(action: {
                    self.isShowPhotoLibrary.toggle()
                }) {
                    Image(systemName: "photo")
                }
                Button(action: {
                    self.isShowCamera.toggle()
                }) {
                    Image(systemName: "camera")
                }
            }.background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).frame(width: 80, height: 20))
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding(.horizontal, 25.0)
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePickerView(sourceType: .photoLibrary) { image in
                self.image = image
            }
        }
        .alert(isPresented: self.$showAlert) { () -> Alert in
            Alert(title: Text("No Image"))
        }
        .onReceive(pub) { (output) in
            self.save()
        }
        //        .sheet(isPresented: $isShowCamera) {
        //            ImagePickerView(sourceType: .camera) { image in
        //                self.image = image
        //            }
        //        } // ADD Camera
    }
}


struct CardTypeView: View {
    @Binding var cardType : CardType
    var body: some View {
        AnyView(HStack(spacing: 30) {
            Button(action: {
                self.cardType = .regular
            }) {
                Image(systemName: "doc.plaintext")
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 5).frame(width: 30, height: 30).foregroundColor((self.cardType == .regular) ? .gray : .white))
            }
            Button(action: {
                self.cardType = .multipleChoice
            }) {
                Image(systemName: "questionmark.square")
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 5).frame(width: 30, height: 30).foregroundColor((self.cardType == .multipleChoice) ? .gray : .white))
            }
            Button(action: {
                self.cardType = .numbered
            }) {
                Image(systemName: "list.number")
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 5).frame(width: 30, height: 30).foregroundColor((self.cardType == .numbered) ? .gray : .white))
            }
            Button(action: {
                self.cardType = .bulleted
            }) {
                Image(systemName: "list.bullet")
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 5).frame(width: 30, height: 30).foregroundColor((self.cardType == .bulleted) ? .gray : .white))
            }
            Button(action: {
                self.cardType = .acronym
            }) {
                Image(systemName: "textformat")
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 5).frame(width: 30, height: 30).foregroundColor((self.cardType == .acronym) ? .gray : .white))
            }
            Button(action: {
                self.cardType = .image
            }) {
                Image(systemName: "camera")
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 5).frame(width: 30, height: 30).foregroundColor((self.cardType == .image) ? .gray : .white))
            }
        })
            .background(RoundedRectangle(cornerRadius: 10).frame(width: 320, height: 40).foregroundColor(.white))
    }
}

