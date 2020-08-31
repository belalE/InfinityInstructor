//
//  CheckListItem.swift
//  InfinityInstructor
//
//  Created by Belal Elsiesy on 8/27/20.
//  Copyright © 2020 Belal Elsiesy. All rights reserved.
//

import Foundation
import SwiftUI

struct CheckListItem:Identifiable{
    var id:Int
    var isChecked: Bool = false
    var set: StudySet
}
