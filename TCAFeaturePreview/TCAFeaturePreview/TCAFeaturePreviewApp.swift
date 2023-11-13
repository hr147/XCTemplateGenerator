//
//  TCAFeaturePreviewApp.swift
//  TCAFeaturePreview
//
//  Created by hrasheed on 13.11.23.
//

import SwiftUI
import DefaultFeature
import ComposableArchitecture

@main
struct TCAFeaturePreviewApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DefaultFeatureView(store: .live)
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Default Template")
                    }
                
                DefaultFeatureView(store: .live)
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Client Template")
                    }
            }
        }
    }
}

extension StoreOf<DefaultFeature> {
    static let live: StoreOf<DefaultFeature> = .init(initialState: DefaultFeature.State(), reducer: DefaultFeature.init)
}
