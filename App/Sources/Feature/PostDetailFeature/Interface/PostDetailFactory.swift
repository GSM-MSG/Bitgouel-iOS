import SwiftUI

public protocol PostDetailFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
