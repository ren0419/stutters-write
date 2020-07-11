//
//  SaveFormat.swift
//  stutters-write-
//
//  Created by ren katahira on 2020/07/11.
//  Copyright © 2020 katahiraren. All rights reserved.
//

import Foundation

struct SaveFormat: Codable {
    var inputText: String
    var textColor: StringColor
    var dateTransferedString: String
    
    enum CodingKeys: String, CodingKey {
        case inputText
        case textColor
        case dateTransferedString
    }
    
    
//    init(inputText: String, textColor: StringColor) {
//        self.inputText = inputText
//        self.textColor = textColor
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy年MM月dd日"
//        self.dateTransferedString = formatter.string(from: Date())
//    }
    
}
extension SaveFormat: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    }
}
