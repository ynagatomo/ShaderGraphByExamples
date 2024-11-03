//
//  ContentView.swift
//  ShaderGraphByExamples
//
//  Created by Yasuhito Nagatomo on 2024/09/29.
//

import SwiftUI
import RealityKit
// import RealityKitContent

struct ContentView: View {
    @Environment(AppModel.self) private var appModel
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            HStack {
                Text("ShaderGraph By Examples")
                    .font(.largeTitle)
                    .padding(.horizontal, 20)
                Spacer()
                Button(action: {
                    closeImmersiveSpace()
                }, label: {
                    Text("Close the Immersive Space")
                }) // Button
                .background(appModel.immersiveSpaceState == .open
                            ? Color.yellow : Color.clear)
                .cornerRadius(26)
                .padding(.horizontal, 20)
                .disabled(appModel.immersiveSpaceState != .open)
            } // HStack
            .padding()

            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 4) {
                        ForEach(ExampleList.examples) { example in
                            NavigationLink {
                                ExampleView(example: example)
                            } label: {
                                ExampleItem(example: example)
                                    .contentShape(.hoverEffect, .rect(cornerRadius: 20))
                                    .hoverEffect()
                            } // NavigationLink
                        } // ForEach
                    } // LazyVGrid
                    .padding()
                } // ScrollView
            } // NavigationStac
        } // VStack
    }

    private func closeImmersiveSpace() {
        guard appModel.immersiveSpaceState == .open else { return }

        Task {
            appModel.immersiveSpaceState = .inTransition
            await dismissImmersiveSpace()
            // Don't set immersiveSpaceState to .closed because there
            // are multiple paths to ImmersiveView.onDisappear().
            // Only set .closed in ImmersiveView.onDisappear().
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
