//
//  iOSClass.swift
//  TweakBuilder
//
//  Created by exerhythm on 17.05.2022.
//

import Foundation

struct iOSClass: Codable, Identifiable {
    var id = UUID()
    var name: String?
    var className: String
    var advanced: Bool?
    var icon: String?
    var layout: [iOSClass]?
}
