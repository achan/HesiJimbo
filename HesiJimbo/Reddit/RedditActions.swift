import ReSwift

struct FetchListings: Action, ImmutableStruct {
	let page: Int
}

struct RequestSuccess: Action {
	let response: Codable
	let action: Action
}

extension FetchListings {
	init() {
		self.init(page: 0)
	}
}
