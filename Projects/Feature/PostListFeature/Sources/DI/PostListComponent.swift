import AuthDomainInterface
import BaseFeature
import InputPostFeatureInterface
import InquiryListFeatureInterface
import NeedleFoundation
import NoticeListFeatureInterface
import PostDetailFeatureInterface
import PostDomainInterface
import PostListFeatureInterface
import SwiftUI

public protocol PostListDependency: Dependency {
    var noticeListFactory: any NoticeListFactory { get }
    var inquiryListFactory: any InquiryListFactory { get }
    var inputPostFactory: any InputPostFactory { get }
    var postDetailFactory: any PostDetailFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
    var postDomainFactory: any PostDomainFactory { get }
}

public final class PostListComponent: Component<PostListDependency>, PostListFactory {
    public func makeView(selection: Binding<TabFlow>) -> some View {
        PostListView(
            viewModel: .init(
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                fetchPostListUseCase: dependency.postDomainFactory.fetchPostListUseCase
            ),
            noticeListFactory: dependency.noticeListFactory,
            inquiryListFactory: dependency.inquiryListFactory,
            inputPostFactory: dependency.inputPostFactory,
            postDetailFactory: dependency.postDetailFactory,
            selection: selection
        )
    }
}
