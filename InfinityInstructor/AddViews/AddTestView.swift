//
//  AddTestView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AddTestView: View {
    @State var name : String
    @State var description : String
    @Binding var classes : [Class]
    @State private var selectedClassIndex : Int? = 0
    @State private var selectedUnitIndex : Int?  = 0
    @State private var selectedValueIndex : Int?
    @State var date : Date?
    
    var body: some View {
        ScrollView {
            VStack {
                Text(verbatim: "Add Test")
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
                PickerField("Test Type", data: ["Formative", "Summative", "Exam"], selectionIndex: self.$selectedValueIndex)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray).frame(width: 350, height: 50, alignment: .leading))
                DateField("Enter the date", date: self.$date)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray).frame(width: 350, height: 50, alignment: .leading))
                CheckListView(checkListData: getChecklistArray(sets: self.classes[selectedClassIndex!].units[selectedUnitIndex!
                ].sets))
                Button(action: {
                    self.classes[self.selectedClassIndex!].units[self.selectedUnitIndex!].tests.append(Test(id: 0, name: self.name, description: self.description, value: self.selectedValueIndex!, date: self.date!, sets: []))
                    NotificationCenter.default.post(name: NSNotification.Name("UpdateFirebase"), object: nil)
                }) {
                    Text(verbatim: "Save")
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue).frame(width: 50,height: 30))
                        .foregroundColor(.white)
                    
                }
            }
            .padding(.all)
        }
    }
}

struct AddTestView_Previews: PreviewProvider {
    static var previews: some View {
        AddTestView(name: "", description: "", classes: .constant([Constants.studyClass1, Constants.studyClass2]))
    }
}
