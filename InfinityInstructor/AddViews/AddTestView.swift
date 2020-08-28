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
    @State var classes : [Class]
    @State private var selectedClassIndex : Int? = 0
    @State private var selectedUnitIndex : Int?  = 0
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
                DateField("Enter the date", date: self.$date)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray).frame(width: 350, height: 50, alignment: .leading))
                Button(action: {
                    self.classes[self.selectedClassIndex!].units.append(Unit(id: 0, name: self.name, description: self.description, tests: [], sets: []))
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
        AddTestView(name: "", description: "", classes: [Constants.studyClass1, Constants.studyClass2])
    }
}
