import ActivityDetailFeatureInterface
import ActivityDomainInterface
import ActivityListFeatureInterface
import AuthDomainInterface
import InputActivityFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol ActivityListDependency: Dependency {
    var activityDetailFactory: any ActivityDetailFactory { get }
    var inputActivityFactory: any InputActivityFactory { get }
    var activityDomainFactory: any ActivityDomainFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
}

public final class ActivityListComponent: Component<ActivityListDependency>, ActivityListFactory {
    @MainActor
    public func makeView(studentID: String) -> some View {
        return ActivityListView(
            viewModel: .init(
                studentID: studentID,
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                fetchMyActivityUseCase: dependency.activityDomainFactory.fetchMyActivityUseCase,
                fetchActivityByIDUseCase: dependency.activityDomainFactory.fetchActivityByIDUseCase
            ),
            inputActivityFactory: dependency.inputActivityFactory,
            activityDetailFactory: dependency.activityDetailFactory
        )
    }
}
