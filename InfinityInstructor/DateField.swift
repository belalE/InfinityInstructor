//
//  DateField.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/25/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation
import SwiftUI
struct DateField: UIViewRepresentable {
    // MARK: - Public properties
    @Binding var date: Date?

    // MARK: - Initializers
    init<S>(_ title: S, date: Binding<Date?>, formatter: DateFormatter = .yearMonthDay) where S: StringProtocol {
        self.placeholder = String(title)
        self._date = date

        self.textField = DateTextField(date: date)
        self.formatter = formatter
    }

    // MARK: - Public methods
    func makeUIView(context: UIViewRepresentableContext<DateField>) -> UITextField {
        textField.placeholder = placeholder
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<DateField>) {
        if let date = date {
            uiView.text = formatter.string(from: date)
        }
    }

    // MARK: - Private properties
    private var placeholder: String
    private let formatter: DateFormatter
    private let textField: DateTextField
}

extension DateFormatter {
    static var yearMonthDay: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}
