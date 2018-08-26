import Foundation

struct RedditListingData: ImmutableStruct, Codable {
	let subreddit: String
	let title: String
	let score: Int
	let isSelf: Bool
	let url: URL
	let createdAt: Date

	enum CodingKeys: String, CodingKey {
		case subreddit
		case title
		case score
		case url
		case createdAt = "created"
		case isSelf = "is_self"
	}
}

struct RedditListing: ImmutableStruct, Codable {
	let data: RedditListingData
}
