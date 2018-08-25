import Foundation
import XCTest
@testable import HesiJimbo

class NewsReducerTests: XCTestCase {
	func testSetNewsWithInitialState() {
		let initialState = NewsState(items: [
			News(
				title: "Item 1",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			),
			News(
				title: "Item 2",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			),
			News(
				title: "Item 3",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			)
			])

		let news = [
			News(
				title: "Item 4",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			),
			News(
				title: "Item 5",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			),
			News(
				title: "Item 6",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			)
		]

		XCTAssertEqual(
			NewsReducer().reduce(action: SetNews(items: news), state: initialState).items,
			news
		)
	}

	func testAppendNewsWithInitialState() {
		let initialState = NewsState(items: [
			News(
				title: "Item 1",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			),
			News(
				title: "Item 2",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			),
			News(
				title: "Item 3",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			)
		])

		let news = [
			News(
				title: "Item 4",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			),
			News(
				title: "Item 5",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			),
			News(
				title: "Item 6",
				postedAt: Date(timeIntervalSince1970: 1535140831.0),
				externalURL: URL(string: "https://nba.com")!,
				preview: .none
			)
		]

		XCTAssertEqual(
			NewsReducer().reduce(action: AppendNews(items: news), state: initialState).items,
			initialState.items + news
		)
	}
}
