//
//  NotationColor.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/07.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import Foundation

struct NotationProperty {
    var color: StringColor
    var save: Bool

    init() {
        color = .white
        save = true
    }
}


enum StringColor {
    case white
    case black
    
}
