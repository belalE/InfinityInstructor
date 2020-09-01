//
//  AddUnitView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AddUnitView: View {
    @State var name : String
    @State var description : String
    @Binding var classes : [Class]
    @State private var selectedClassIndex : Int? = 0
    var body: some View {
        ScrollView {
            VStack {
                Text(verbatim: "Add Unit")
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
                .navigationBarTitle("Add Unit")
                Spacer()
                Button(action: {
                    self.classes[self.selectedClassIndex!].units.append(Unit(id: 0, name: self.name, description: self.description, tests: [], sets: []))
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

struct AddUnitView_Previews: PreviewProvider {
    static var previews: some View {
        return AddUnitView(name: "", description: "", classes: .constant([Constants.studyClass1,Constants.studyClass2]))
    }
}
