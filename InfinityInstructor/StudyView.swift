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
    @State var isReview : Bool
    var body: some View {
        
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
                CardView(card: self.set.array[index], flipped: $flipped)
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
        StudyView(set: Constants.diverseSet, index: 0, isReview: false)
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

func getStudySet(set: StudySet, isReview: Bool) -> [Card] {
    var arr = [Card]()
    if isReview {
        return getReviewArray(set: set)
    }
    return set.array
}
