import XCTest

extension XCTestCase {
	func wait(timeout seconds: TimeInterval) {
		let verification = XCTestExpectation(description: "Wait for async calls")
		DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
			verification.fulfill()
		}

		wait(for: [verification], timeout: seconds)
	}
}
