// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import Foundation

internal extension AppendNews {
  func items(_ items: [News]) -> AppendNews {
    return AppendNews(
      items: items
    )
  }
}
internal extension News {
  func title(_ title: String) -> News {
    return News(
      title: title,
      postedAt: self.postedAt,
      externalURL: self.externalURL,
      preview: self.preview
    )
  }
  func postedAt(_ postedAt: Date) -> News {
    return News(
      title: self.title,
      postedAt: postedAt,
      externalURL: self.externalURL,
      preview: self.preview
    )
  }
  func externalURL(_ externalURL: URL) -> News {
    return News(
      title: self.title,
      postedAt: self.postedAt,
      externalURL: externalURL,
      preview: self.preview
    )
  }
  func preview(_ preview: Preview) -> News {
    return News(
      title: self.title,
      postedAt: self.postedAt,
      externalURL: self.externalURL,
      preview: preview
    )
  }
}
internal extension NewsState {
  func items(_ items: [News]) -> NewsState {
    return NewsState(
      items: items
    )
  }
}
internal extension SetNews {
  func items(_ items: [News]) -> SetNews {
    return SetNews(
      items: items
    )
  }
}
