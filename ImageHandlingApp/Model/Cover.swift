//
//  Cover.swift
//  ImageHandlingApp
//
//  Created by mohammed on 17/02/2024.
//

import Foundation

struct Cover : Identifiable{
    var id: Int
    var coverName: String
    var thumbnail: String{
        return "thumb-" + coverName
    }
}
