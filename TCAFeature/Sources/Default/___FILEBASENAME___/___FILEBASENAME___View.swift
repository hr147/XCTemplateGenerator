// ___FILEHEADER___

import ComposableArchitecture
import SwiftUI

public struct ___VARIABLE_FEATURENAME___View: View {
    private let store: StoreOf<___VARIABLE_FEATURENAME___>

    public init(store: StoreOf<___VARIABLE_FEATURENAME___>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store) { $0 } content: { viewStore in
            ForEach(viewStore.rows) { row in
                Text(row.title)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}

struct ___FILEBASENAMEASIDENTIFIER____Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_FEATURENAME___View(
            store: .init(
                initialState: ___VARIABLE_FEATURENAME___.State(),
                reducer: ___VARIABLE_FEATURENAME___.init
            )
        )
    }
}
