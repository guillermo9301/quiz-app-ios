//
//  EP3_PRACTICEApp.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 14/11/23.
//

import SwiftUI

@main
struct EP3_PRACTICEApp: App {
    @StateObject var appState = AppState.shared
    var body: some Scene {
        WindowGroup {
            ContentView().id(appState.quizID)
        }
    }
}
