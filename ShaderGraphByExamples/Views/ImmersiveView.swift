//
//  ImmersiveView.swift
//  ShaderGraphByExamples
//
//  Created by Yasuhito Nagatomo on 2024/09/29.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Binding var example: Example?

    var body: some View {
        RealityView { content in
            if let example,
               let root = try? await Entity(named: example.sceneName,
                                            in: realityKitContentBundle) {
                root.position = [0, 1.5, -1.5]
                content.add(root)
            }
        }
    }
}

//    #Preview(immersionStyle: .mixed) {
//        ImmersiveView(example: ExampleList.examples.first)
//            .environment(AppModel())
//    }
