//
//  ShaderGraphByExamplesApp.swift
//  ShaderGraphByExamples
//
//  Created by Yasuhito Nagatomo on 2024/09/29.
//

import SwiftUI

@main
struct ShaderGraphByExamplesApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
                .frame(width: 900, height: 600)
        }
        .windowStyle(.plain)
        .windowResizability(.contentSize)

        ImmersiveSpace(id: appModel.immersiveSpaceID, for: Example.self) { example in
            ImmersiveView(example: example)
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
