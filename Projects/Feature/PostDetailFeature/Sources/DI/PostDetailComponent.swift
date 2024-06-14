import InputPostFeatureInterface
import NeedleFoundation
import PostDetailFeatureInterface
import PostDomainInterface
import SwiftUI

public protocol PostDetailDependency: Dependency {
    var inputPostFactory: any InputPostFactory { get }
    var postDomainFactory: any PostDomainFactory { get }
}

public final class PostDetailComponent: Component<PostDetailDependency>, PostDetailFactory {
    public func makeView(
        postID: String
    ) -> some View {
        PostDetailView(
            viewModel: .init(
                postID: postID,
                fetchPostDetailUseCase: dependency.postDomainFactory.fetchPostDetailUseCase,
                deletePostUseCase: dependency.postDomainFactory.deletePostUseCase
            ),
            inputPostFactory: dependency.inputPostFactory
        )
    }
}
