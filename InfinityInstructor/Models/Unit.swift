//
//  Unit.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 6/12/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation

struct Unit : Identifiable {
    var id: Int
    var name: String
    var description: String
    var tests : [Test]
    var sets : [StudySet]
}
