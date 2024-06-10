import ActivityDetailFeatureInterface
import ActivityDomainInterface
import AuthDomainInterface
import InputActivityFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol ActivityDetailDependency: Dependency {
    var inputActivityFactory: any InputActivityFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
    var activityDomainFactory: any ActivityDomainFactory { get }
}

public final class ActivityDetailComponent: Component<ActivityDetailDependency>, ActivityDetailFactory {
    @MainActor
    public func makeView(activityID: String) -> some View {
        ActivityDetailView(
            viewModel: .init(
                activityID: activityID,
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                fetchActivityDetailUseCase: dependency.activityDomainFactory.fetchActivityDetailUseCase,
                deleteActivityUseCase: dependency.activityDomainFactory.deleteActivityUseCase
            ),
            inputActivityFactory: dependency.inputActivityFactory
        )
    }
}
