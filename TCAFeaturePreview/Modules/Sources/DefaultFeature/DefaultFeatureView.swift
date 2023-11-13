// 
//  DefaultFeatureView.swift
//  
//
//  Created by hrasheed on 13.11.23.
//

import ComposableArchitecture
import SwiftUI

public struct DefaultFeatureView: View {
    private let store: StoreOf<DefaultFeature>

    public init(store: StoreOf<DefaultFeature>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { $0 } content: { viewStore in
            List(viewStore.rows) { row in
                Text(row.title)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

struct DefaultFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultFeatureView(
            store: .init(
                initialState: DefaultFeature.State(),
                reducer: DefaultFeature.init
            )
        )
    }
}
