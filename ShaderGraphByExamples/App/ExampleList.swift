//
//  ExampleList.swift
//  ShaderGraphByExamples
//
//  Created by Yasuhito Nagatomo on 2024/11/03.
//

import Foundation

struct Example: Identifiable, Codable, Hashable {
    var id = UUID()
    let name: String
    let thumbnail: String
    let sceneName: String // Scene name in the RealityKitContent
    let description: [String]
    let dragable: Bool
}

enum ExampleList {
    static let examples: [Example] = [
        // [Ex01: Interior Mapping]
        Example(name: "Interior Mapping",
                thumbnail: "ex01",
                sceneName: "Ex01",
                description: [
                    "Calculating the intersection of the line of sight and the wall and draw a space with pseudo depth."
                ],
                dragable: false)
    ]
}
