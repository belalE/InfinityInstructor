//
//  AddSetView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AddSetView: View {
    @State var name : String
    @State var description : String
    @Binding var classes : [Class]
    @State private var selectedClassIndex : Int? = 0
    @State private var selectedUnitIndex : Int?  = 0
    @State var array : [Card]
    
    func save() {
        //need to save subviews
        NotificationCenter.default.post(name: NSNotification.Name("Save"), object: nil)
        self.classes[self.selectedClassIndex!].units[self.selectedUnitIndex!].sets.append(StudySet(id: 0, name: self.name, description: self.description, score: 0, date: Date(timeIntervalSinceNow: 0), array: self.array))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group {
                    Text(verbatim: "Add Set")
                        .font(.largeTitle)
                    TextField("Name", text: $name)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
                    TextField("Description", text: $description)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
                    PickerField("Select A Class", data: getNameArray(classes: classes), selectionIndex: self.$selectedClassIndex)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray).frame(width: 350, height: 50, alignment: .leading))
                    PickerField("Select A Unit", data: getNameArray(units: self.classes[self.selectedClassIndex!].units), selectionIndex: self.$selectedUnitIndex)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray).frame(width: 350, height: 50, alignment: .leading))
                    ForEach(self.array, id: \.id) { i in
                        AddCardView(cardType: .regular, array: self.$array)
                    }
                    Button(action: {
                        self.array.append(RegularCard(id: 0, front: "", score: 0, back: ""))
                    }) {
                        Text(verbatim: "Add")
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue).frame(width: 50,height: 30))
                            .foregroundColor(.white)
                        
                    }
                    Button(action: {
                        self.classes[self.selectedClassIndex!].units[self.selectedUnitIndex!].sets.append(StudySet(id: 0, name: self.name, description: self.description, score: 0, date: Date(timeIntervalSinceNow: 0), array: self.array))
                        NotificationCenter.default.post(name: NSNotification.Name("UpdateFirebase"), object: nil)
                    }) {
                        Text(verbatim: "Save")
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue).frame(width: 50,height: 30))
                            .foregroundColor(.white)
                        
                    }
                }
                
            }
            .padding(.all)
        }
    }
}

struct AddSetView_Previews: PreviewProvider {
    static var previews: some View {
        return AddSetView(name: "", description: "", classes: .constant([Constants.studyClass2, Constants.studyClass1]), array: [])
    }
}
