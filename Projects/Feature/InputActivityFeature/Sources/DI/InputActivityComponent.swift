import ActivityDetailSettingFeatureInterface
import ActivityDomainInterface
import InputActivityFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputActivityDependency: Dependency {
    var activityDetailSettingFactory: any ActivityDetailSettingFactory { get }
    var activityDomainFactory: any ActivityDomainFactory { get }
}

public final class InputActivityComponent: Component<InputActivityDependency>, InputActivityFactory {
    public func makeView(
        state: String,
        activityID: String
    ) -> some View {
        InputActivityView(
            viewModel: .init(
                state: state,
                activityID: activityID,
                fetchActivityDetailUseCase: dependency.activityDomainFactory.fetchActivityDetailUseCase,
                inputActivityUseCase: dependency.activityDomainFactory.inputActivityUseCase,
                modifyActivityUseCase: dependency.activityDomainFactory.modifyActivityUseCase
            ),
            activityDetailSettingFactory: dependency.activityDetailSettingFactory
        )
    }
}
