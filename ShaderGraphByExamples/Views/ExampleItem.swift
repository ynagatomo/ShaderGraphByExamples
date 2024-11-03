//
//  ExampleItem.swift
//  ShaderGraphByExamples
//
//  Created by Yasuhito Nagatomo on 2024/11/03.
//

import UIKit
import SwiftUI
import RealityKit

struct ExampleItem: View {
    let example: Example

    var body: some View {
        Image(example.thumbnail)
            .resizable()
            .scaledToFill()
            .frame(width: 280)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(alignment: .bottomTrailing) {
                VStack {
                    Text(example.name)
                        .font(.title)
                    Text("ShaderGraph: " + example.sceneName)
                        .foregroundStyle(.secondary)
                    ForEach(example.description, id: \.self) { description in
                        Text(description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                } // VStack
                .padding()
            } // overlay
    }
}
