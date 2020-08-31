//
//  CheckView.swift
//  Tips_08_04_ToDoList
//
//  Created by Steven Lipton on 8/13/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//
import SwiftUI

struct CheckView: View {
    @State var isChecked:Bool = false
    var set: StudySet
    func toggle(){isChecked = !isChecked}
    var body: some View {
        HStack{
            Button(action: toggle) {
                Image(systemName: isChecked ? "checkmark.square" : "square")
            }
            Text(set.name)
        }
    }
}

#if DEBUG
struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        CheckView(set: Constants.set1)
    }
}
#endif
