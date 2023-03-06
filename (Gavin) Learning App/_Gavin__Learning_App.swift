//
//  _Gavin__Learning_AppApp.swift
//  (Gavin) Learning App
//
//  Created by Gavin Kwon on 3/5/23.
//

import SwiftUI

@main
struct _Gavin__Learning_App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContenModel())
        }
    }
}
