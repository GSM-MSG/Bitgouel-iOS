import InputPostFeatureInterface
import NeedleFoundation
import PostDetailSettingFeatureInterface
import PostDomainInterface
import SwiftUI

public protocol InputPostDependency: Dependency {
    var postDetailSettingFactory: any PostDetailSettingFactory { get }
    var postDomainFactory: any PostDomainFactory { get }
}

public final class InputPostComponent: Component<InputPostDependency>, InputPostFactory {
    public func makeView(
        state: String,
        postID: String
    ) -> some View {
        InputPostView(
            viewModel: .init(
                state: state,
                postID: postID,
                writePostUseCase: dependency.postDomainFactory.writePostUseCase,
                updatePostUseCase: dependency.postDomainFactory.updatePostUseCase,
                fetchPostDetailUseCase: dependency.postDomainFactory.fetchPostDetailUseCase
            ),
            postDetailSettingFactory: dependency.postDetailSettingFactory
        )
    }
}
