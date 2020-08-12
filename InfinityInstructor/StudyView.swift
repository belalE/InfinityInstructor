//
//  StudyView.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/14/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import SwiftUI

struct StudyView: View {
    @State var set: StudySet
    @State var index: Int
    @State var flipped : Bool = false
    @State var increased : Int = 0
    @State var decreased : Int = 0
    @State var stayed : Int = 0
    @State var green = 0
    @State var yellow = 0
    @State var red = 0
    @State var isDone = false
    var body: some View {
        let flipDegrees = flipped ? 180.0 : 0
        
        return VStack{
            NavigationLink(destination: SummaryView(set: self.set, increased: self.increased, decreased: self.decreased, stayed: self.stayed), isActive: $isDone) { EmptyView() }
            ZStack {
                Rectangle()
                    .frame(width: 400, height: 10, alignment: .center)
                    .foregroundColor(.white)
                Text("\(index + 1) / \(set.array.count)")
            }
            Spacer()
            ZStack {
                Image("wood")
                    .resizable()
                CardView(card: set.array[index], flipped: $flipped)
            }
            Spacer()
            ZStack{
                
                Rectangle()
                    .frame(width: 300, height: 70, alignment: .center)
                    .foregroundColor(.white)
                HStack {
                    Button(action: {
                        if self.flipped {
                            self.flipped.toggle()
                        }
                        if self.set.array[self.index].score > 1 {
                            self.increased += 1
                        } else if self.set.array[self.index].score == 1 {
                            self.stayed += 1
                        } else {
                            self.decreased += 1
                        }
                        self.set.array[self.index].score = 1
                        self.red += 1
                        if (self.index + 1) == self.set.array.count {
                            self.finish()
                        } else {
                            self.index += 1
                        }
                    }) {
                        Text("\(self.red)")
                            .foregroundColor(.black)
                            .background(Rectangle().foregroundColor(.red).frame(width: 75, height: 75, alignment: .center).cornerRadius(15))
                        
                    }
                    Spacer()
                        .frame(width: 100)
                    Button(action: {
                        if self.flipped {
                            self.flipped.toggle()
                        }
                        if self.set.array[self.index].score > 2 {
                            self.increased += 1
                        } else if self.set.array[self.index].score == 2 {
                            self.stayed += 1
                        } else {
                            self.decreased += 1
                        }
                        self.set.array[self.index].score = 2
                        self.yellow += 1
                        if (self.index + 1) == self.set.array.count {
                            self.finish()
                        } else {
                            self.index += 1
                        }
                    }) {
                        Text("\(self.yellow)")
                            .foregroundColor(.black)
                            .background(Rectangle().foregroundColor(.yellow).frame(width: 75, height: 75, alignment: .center).cornerRadius(15))
                        
                    }
                    Spacer()
                        .frame(width: 100)
                    Button(action: {
                        if self.flipped {
                            self.flipped.toggle()
                        }
                        if self.set.array[self.index].score > 3 {
                            self.increased += 1
                        } else if self.set.array[self.index].score == 3 {
                            self.stayed += 1
                        } else {
                            self.decreased += 1
                        }
                        self.set.array[self.index].score = 3
                        self.green += 1
                        if (self.index + 1) == self.set.array.count {
                            self.finish()
                        } else {
                            self.index += 1
                        }
                    }) {
                        Text("\(self.green)")
                            .foregroundColor(.black)
                            .background(Rectangle().foregroundColor(.green).frame(width: 75, height: 75, alignment: .center).cornerRadius(15))
                    }
                }
            }
        }
    }
    
    private func finish() {
        rearrangeSet(set: self.set)
        avgScore(set: self.set)
        self.isDone.toggle()
    }
}

struct StudyView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView(set: StudySet(id: 0, name: "Quadratics", description: "", score: 1, date: Date(timeIntervalSinceNow: 300), array: [RegularCard(id: 0, front: "Vertex Form", back: "A form for a quadratic equation that shows the vertex.", score: 2),RegularCard(id: 1, front: "Vertical Shift", back: "This is what happens when you change k. It raises or lowers the graph.", score: 3),RegularCard(id: 2, front: "Zeros of a function", back: "The x-values where a function crosses the x-axis ", score: 1), MultipleChoiceCard(id: 0, front: "2x = 6 ", correct: "x = 3", score: 2, incorrectOptions: ["x=2", "x=-2","x=-3"]), BulletedCard(id: 0, front: "types of function", score: 1, bullets: ["linear","Quadratic","Exponential","Cubic", "Reciprocal","Square Root"]),NumberedCard(id: 0, front: "Levels of Organization within Organism", score: 1, list: ["cell","tissue","organ","Organ System"]), AcronymCard(id: 0, front: "PMAT", score: 2, meaning: ["Prophase","Metaphase","Anaphase","Telophase"]), ImageCard(id: 0, front: "Parabola", score: 2, image: "parabola")], setType: .factSet, nextDate: Date(timeIntervalSinceNow: 403432323232343)), index: 0)
    }
}

extension View {
    
    func flipRotate(_ degrees : Double) -> some View {
        return rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
    }
    
    func placedOnCard(_ color: Color) -> some View {
        return padding(5).frame(width: 350, height: 500, alignment: .center).background(color).cornerRadius(20).overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 5))
    }
}
