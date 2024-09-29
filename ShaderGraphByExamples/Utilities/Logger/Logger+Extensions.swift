//
//  Logger+Extensions.swift
//  ShaderGraphByExamples
//
//  Created by Yasuhito Nagatomo on 2024/09/29.
//

import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier!

    // @MainActor static let appRunning = Logger(subsystem: subsystem, category: "apprunning")
    // @MainActor static let statistics = Logger(subsystem: subsystem, category: "statistics")
    static let appRunning = Logger(subsystem: subsystem, category: "apprunning")
    static let statistics = Logger(subsystem: subsystem, category: "statistics")
}
