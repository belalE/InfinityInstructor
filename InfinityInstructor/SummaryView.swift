//
//  SummaryView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/15/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    var set : StudySet
    var increased: Int
    var decreased: Int
    var stayed : Int
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack {
            Text("Summary")
                .font(.title)
            Group {
                HStack {
                    Image(systemName: "arrow.up.square.fill")
                        .foregroundColor(.green)
                    Text("Increased")
                    Spacer()
                        .frame(width: 211)
                    Text("\(self.increased)")
                }
                .frame(width: 350)
                HStack {
                    Image(systemName: "equal.square.fill")
                        .foregroundColor(.yellow)
                    Text("Stayed")
                    Spacer()
                        .frame(width: 230)
                    Text("\(self.stayed)")
                }
                .frame(width: 350)
                HStack {
                    Image(systemName: "arrow.down.square.fill")
                        .foregroundColor(.red)
                    Text("Decreased")
                    Spacer()
                        .frame(width: 200)
                    Text("\(self.decreased)")
                }
                .frame(width: 350)
            } //increased
            Spacer()
            .frame(height: 20)
            Divider()
                .frame(width: 300)
            Spacer()
                .frame(height: 40)
            HStack {
                VStack {
                    Text("Red")
                    Spacer()
                    .frame(height: 10)
                    Text("\(numColor(set: self.set, color: 1))")
                }
                .background(Rectangle().foregroundColor(.red).cornerRadius(20).frame(width: 80, height: 80))
                Spacer()
                .frame(width: 50)
                VStack {
                    Text("Yellow")
                    Spacer()
                    .frame(height: 10)
                    Text("\(numColor(set: self.set, color: 2))")
                }
                .background(Rectangle().foregroundColor(.yellow).cornerRadius(20).frame(width: 80, height: 80))
                Spacer()
                    .frame(width: 50)
                VStack {
                    Text("Green")
                    Spacer()
                        .frame(height: 10)
                    Text("\(numColor(set: self.set, color: 3))")
                }
                .background(Rectangle().foregroundColor(.green).cornerRadius(20).frame(width: 80, height: 80))
            }
            Spacer()
                .frame(height: 50)
            Group {
                Text("Score:\(self.set.score)")
                    .foregroundColor(.black)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(scoreToColor(score: self.set.score))
                    .frame(width: 260,height: 60))
                    
            }
            
            Spacer()
                .frame(height: 35)
            
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Rectangle().foregroundColor(.blue).cornerRadius(20).frame(width: 80, height: 30).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black,lineWidth: 3)))
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(set: Constants.set1, increased: 1, decreased: 2, stayed: 1)
    }
}
