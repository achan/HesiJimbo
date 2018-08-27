@testable import HesiJimbo
import XCTest
import ReSwift

class StoreSubscriberTests: XCTestCase {
	func testFetchNews() {
		let storeCreator = StoreCreator(session: URLSession.shared)
		let store = storeCreator.create()
		let subscriber = MockSubscriber()

		store.subscribe(subscriber)
		store.dispatch(FetchNews(page: 0))
		wait(timeout: 0.5)

		XCTAssertTrue(subscriber.receivedState?.news.items.count ?? 0 > 0)
	}
}
