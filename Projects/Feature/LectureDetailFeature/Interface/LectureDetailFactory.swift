import SwiftUI

public protocol LectureDetailFactory {
    associatedtype SomeView: View
    func makeView(lectureID: String) -> SomeView
}
