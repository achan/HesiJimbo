import ReSwift

struct SetNews: Action, ImmutableStruct {
	let items: [News]
}

struct AppendNews: Action, ImmutableStruct {
	let items: [News]
}

struct FetchNews: Action, ImmutableStruct {
	let page: Int
}

extension FetchNews {
	init() {
		self.init(page: 0)
	}
}
