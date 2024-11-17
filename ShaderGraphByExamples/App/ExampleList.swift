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
                dragable: false),
        // [Ex02: Warp VFX]
        Example(name: "Warp VFX",
                thumbnail: "ex02",
                sceneName: "Ex02",
                description: [
                    // swiftlint:disable:next line_length
                    "A procedural warp effect shader. You can change the movement, color, and pattern by changing the node's parameters."
                ],
                dragable: false),
        // [Ex03: Jewel]
        Example(name: "Jewel",
                thumbnail: "ex03",
                sceneName: "Ex03",
                description: [
                    "A very simple Jewel shader with the Environment Radiance Node."
                ],
                dragable: false),
        // [Ex04: Nebula with a 3D texture]
        Example(name: "Nebula 3D",
                thumbnail: "ex04",
                sceneName: "Ex04",
                description: [
                    "A nebula with a 3D texture consisting of six 2D texture slices."
                ],
                dragable: true),
        // [Ex05: Transition with a Depth-map]
        Example(name: "Transition Depth",
                thumbnail: "ex05",
                sceneName: "Ex05",
                description: [
                    "A transition with a depth-map."
                ],
                dragable: true)
    ]
}
