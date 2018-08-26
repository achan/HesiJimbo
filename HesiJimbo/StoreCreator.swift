import ReSwift

struct AppState: StateType, ImmutableStruct {
	let news: NewsState
}

extension AppState {
	init() {
		self.init(news: NewsState(items: []))
	}
}

private func rootReducer(action: Action, state: AppState?) -> AppState {
	return AppState(
		news: NewsReducer().reduce(action: action, state: state?.news)
	)
}

class StoreCreator {
	private let session: URLSession
	private let newsMiddleware = NewsMiddleware()
	private let redditMiddleware: RedditMiddleware

	init(session: URLSession) {
		self.session = session
		self.redditMiddleware = RedditMiddleware(session: session)
	}

	func create() -> Store<AppState> {
		return Store(
			reducer: rootReducer,
			state: AppState(),
			middleware: [
				newsMiddleware.handle,
				redditMiddleware.handle()
			]
		)
	}
}
