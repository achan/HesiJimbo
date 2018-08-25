import ReSwift

struct NewsState: StateType, ImmutableStruct {
	let items: [News]
}

struct SetNews: Action, ImmutableStruct {
	let items: [News]
}

struct AppendNews: Action, ImmutableStruct {
    let items: [News]
}

struct NewsReducer {
	func reduce(action: Action, state: NewsState?) -> NewsState {
		let state = state ?? NewsState(items: [])

		switch action {
		case _ as ReSwiftInit:
			break
		case let action as SetNews:
			return state.items(action.items)
        case let action as AppendNews:
            return state.items(state.items + action.items)
		default:
			break
		}

		return state
	}
}
