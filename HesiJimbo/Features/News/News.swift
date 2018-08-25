import Foundation

enum Preview {
	case none, image, video
}

struct News: ImmutableStruct, AutoEquatable {
	let title: String
	let postedAt: Date
	let externalURL: URL
	let preview: Preview
}
