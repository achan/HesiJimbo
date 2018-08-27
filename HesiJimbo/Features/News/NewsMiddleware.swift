import ReSwift

class NewsMiddleware {
	let handle: Middleware<AppState> = { dispatch, getState in
		return { next in
			return { action in
				switch action {
				case let action as FetchNews:
					next(FetchListings(page: action.page))
				case let action as RequestSuccess:
					if let requestedAction = action.action as? FetchListings, let listings = action.response as? RedditListings {
						let news = listings.data.children
							.filter { !$0.data.isSelf }
							.map { toNews($0) }

						next(SetNews(items: news))
					}
				default:
					break
				}

				return next(action)
			}
		}
	}
}

private func toNews(_ listing: RedditListing) -> News {
	return News(
		title: listing.data.title,
		postedAt: Date(timeIntervalSinceNow: 0),
		externalURL: listing.data.url,
		preview: .none
	)
}
