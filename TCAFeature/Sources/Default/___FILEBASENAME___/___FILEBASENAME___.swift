//___FILEHEADER___

import ComposableArchitecture
import Foundation

public struct ___VARIABLE_FEATURENAME___: Reducer {
    public struct State: Equatable {
        var rows: [Row]
        
        public init(rows: [Row] = []) {
            self.rows = rows
        }
    }

    public struct Row: Equatable, Identifiable {
        public let id = UUID()
        let title: String
    }
    
    public enum Action: Equatable {
        case onAppear
    }

    public init() {}
    
    public func reduce(into state: inout State, action: Action) -> EffectOf<Self> {
        switch action {
        case .onAppear:
            state.rows = (0...10).map { Row(title: "element # \($0)") }
            return .none
        }
    }
}
