import ReSwift

struct AppState: StateType {
	
}

private func rootReducer(action: Action, state: AppState?) -> AppState {
	return AppState()
}

func createStore() -> ReSwift.Store<AppState> {
	return Store(reducer: rootReducer, state: AppState(), middleware: [])
}
