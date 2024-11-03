//
//  ExampleView.swift
//  ShaderGraphByExamples
//
//  Created by Yasuhito Nagatomo on 2024/11/03.
//

import SwiftUI
import RealityKit

struct ExampleView: View {
    @Environment(AppModel.self) private var appModel
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    let example: Example

    var body: some View {
        HStack {
            Image(example.thumbnail)
                .resizable()
                .scaledToFit()
                .frame(height: 300)

            VStack {
                Text(example.name)
                    .font(.title)
                    .padding()

                Text("ShaderGraph: " + example.sceneName)
                    .foregroundStyle(.secondary)
                    .padding()

                ForEach(example.description, id: \.self) { description in
                    Text(description)
                        .foregroundStyle(.secondary)
                } // ForEach

                Button(action: { showImmersiveSpace() }, label: {
                    Text("Open the Example Scene")
                })
                .background(appModel.immersiveSpaceState == .closed
                            ? Color.blue : Color.clear)
                .cornerRadius(26)
                .disabled(appModel.immersiveSpaceState != .closed)
                .padding()
            } // VStack
        } // HStack
    } // body

    private func showImmersiveSpace() {
        guard appModel.immersiveSpaceState == .closed else { return }

        Task {
            appModel.immersiveSpaceState = .inTransition
            switch await openImmersiveSpace(id: appModel.immersiveSpaceID,
                                            value: example) {
            case .opened:
                // Don't set immersiveSpaceState to .open because there
                // may be multiple paths to ImmersiveView.onAppear().
                // Only set .open in ImmersiveView.onAppear().
                break
            case .userCancelled, .error:
                // On error, we need to mark the immersive space
                // as closed because it failed to open.
                fallthrough
            @unknown default:
                // On unknown response, assume space did not open.
                appModel.immersiveSpaceState = .closed
            }
        }
    }
}
