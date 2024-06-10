import AuthDomainInterface
import FAQDomainInterface
import MainFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol MainDependency: Dependency {
    var authDomainFactory: any AuthDomainFactory { get }
    var faqDomainFactory: any FAQDomainFactory { get }
}

public final class MainComponent: Component<MainDependency>, MainFactory {
    public func makeView() -> some View {
        MainView(
            viewModel: .init(
                fetchFAQListUseCase: dependency.faqDomainFactory.fetchFAQListUseCase,
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                inputFAQUseCase: dependency.faqDomainFactory.inputFAQUseCase
            )
        )
    }
}
