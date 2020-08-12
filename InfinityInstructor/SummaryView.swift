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
                .frame(height: 40)
            Group {
                Text("Score:\(self.set.score)")
                    .foregroundColor(scoreToColor(score: self.set.score))
            }
            
            Spacer()
                .frame(height: 15)
            
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
        SummaryView(set: StudySet(id: 0, name: "Quadratics", description: "", score: 1, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2),RegularCard(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3),RegularCard(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1)], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 40341231313213343)), increased: 1, decreased: 2, stayed: 1)
    }
}
