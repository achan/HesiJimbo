struct RedditListingsData: Codable, ImmutableStruct {
	let children: [RedditListing]
	let after: String?
	let before: String?
}

struct RedditListings: Codable, ImmutableStruct {
	let kind: String
	let data: RedditListingsData
}
