import SwiftUI

public protocol NoticeDetailFactory {
    associatedtype SomeView: View
    func makeView(noticeID: String) -> SomeView
}
