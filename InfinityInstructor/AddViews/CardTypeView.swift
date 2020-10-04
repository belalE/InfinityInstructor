//
//  CardTypeView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 9/3/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

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



struct CardTypeView_Previews: PreviewProvider {
    static var previews: some View {
        CardTypeView(cardType: .constant(.regular))
    }
}
