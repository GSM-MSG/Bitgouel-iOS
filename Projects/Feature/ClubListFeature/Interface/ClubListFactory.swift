import BaseFeature
import SwiftUI

public protocol ClubListFactory {
    associatedtype SomeView: View
    func makeView(selection: Binding<TabFlow>) -> SomeView
}
