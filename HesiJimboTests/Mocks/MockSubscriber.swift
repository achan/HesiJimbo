@testable import HesiJimbo
import ReSwift

class MockSubscriber: StoreSubscriber {
	var receivedState: AppState?

	func newState(state: AppState) {
		receivedState = state
	}
}
