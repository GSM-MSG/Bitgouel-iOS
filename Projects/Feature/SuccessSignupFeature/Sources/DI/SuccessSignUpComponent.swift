import NeedleFoundation
import SuccessSignupFeatureInterface
import SwiftUI

public protocol SuccessSignUpDependency: Dependency {}

public final class SuccessSignUpComponent: Component<SuccessSignUpDependency>, SuccessSignUpFactory {
    public func makeView() -> some View {
        SuccessSignUpView()
    }
}
