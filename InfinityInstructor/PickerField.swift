//
//  PickerField.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/25/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation
import SwiftUI

struct PickerField: UIViewRepresentable {
    // MARK: - Public properties
    @Binding var selectionIndex: Int?

    // MARK: - Initializers
    init<S>(_ title: S, data: [String], selectionIndex: Binding<Int?>) where S: StringProtocol {
        self.placeholder = String(title)
        self.data = data
        self._selectionIndex = selectionIndex

        textField = PickerTextField(data: data, selectionIndex: selectionIndex)
    }

    // MARK: - Public methods
    func makeUIView(context: UIViewRepresentableContext<PickerField>) -> UITextField {
        textField.placeholder = placeholder
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<PickerField>) {
        if let index = selectionIndex {
            uiView.text = data[index]
        } else {
            uiView.text = ""
        }
    }

    // MARK: - Private properties
    private var placeholder: String
    private var data: [String]
    private let textField: PickerTextField
}
