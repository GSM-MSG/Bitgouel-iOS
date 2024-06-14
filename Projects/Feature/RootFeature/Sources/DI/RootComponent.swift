//import FindPasswordFeatureInterface
import LoginFeatureInterface
import MainTabFeatureInterface
import NeedleFoundation
import SuccessSignupFeatureInterface
import SwiftUI

public protocol RootDependency: Dependency {
    var loginFactory: any LoginFactory { get }
    var mainTabFactory: any MainTabFactory { get }
//    var findPasswordFactory: any FindPasswordFactory { get }
    var successSignUpFactory: any SuccessSignUpFactory { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            loginFactory: self.dependency.loginFactory,
            mainTabFactory: self.dependency.mainTabFactory,
//            findPasswordFactory: self.dependency.findPasswordFactory,
            successSignUpFactory: self.dependency.successSignUpFactory
        )
    }
}
