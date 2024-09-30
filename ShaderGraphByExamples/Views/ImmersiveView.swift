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

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "ExAdv01", in: realityKitContentBundle) {
                immersiveContentEntity.position = [0, 1.5, -1.5]
                content.add(immersiveContentEntity)

                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
