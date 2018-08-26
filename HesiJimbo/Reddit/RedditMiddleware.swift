import ReSwift
import Foundation

class RedditMiddleware {
	let session: URLSession

	init(session: URLSession) {
		self.session = session
	}

	func handle() -> Middleware<AppState> {
		return { [weak self] dispatch, getState in
			return { next in
				return { action in
					guard let strongSelf = self else {
						return next(action)
					}

					switch (action) {
					case let action as FetchListings:
						strongSelf.fetchListings(action: action, dispatch: dispatch)
					default:
						break
					}

					return next(action)
				}
			}
		}
	}

	private func fetchListings(action: FetchListings, dispatch: @escaping DispatchFunction) {
		guard let url = URL(string: "https://www.reddit.com/r/nba.json") else {
			fatalError("Unable to parse URL to build NBA listings")
		}

		session.dataTask(with: url) { data, response, error in
			guard let data = data else { return }

			do {
				let decoder = JSONDecoder()
				let listings = try decoder.decode(RedditListings.self, from: data)
				dispatch(RequestSuccess(response: listings, action: action))
			}
			catch let error {
				print("Failed to fetch listings: \(error.localizedDescription)")
			}
			}.resume()
	}
}
