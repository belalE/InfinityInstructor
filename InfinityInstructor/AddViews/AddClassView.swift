//
//  AddClassView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct AddClassView: View {
    @State var name : String
    @State var description : String
    @State var classes: [Class]

    var body: some View {
        VStack {
            Text(verbatim: "Add Class")
            TextField("Name", text: $name)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            TextField("Description", text: $description)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.gray))
            Spacer()
            Button(action: {
                self.classes.append(Class(id: 0, name: self.name, description: self.description, units: []))
            }) {
                Text(verbatim: "Save")
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue).frame(width: 50,height: 30))
                    .foregroundColor(.white)

            }
        }
        .padding(.all)
    }
}

struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        return AddClassView(name: "", description: "", classes: [Constants.studyClass1,Constants.studyClass2])
    }
}
