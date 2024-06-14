import InputNoticeFeatureInterface
import NeedleFoundation
import NoticeDetailFeatureInterface
import PostDomainInterface
import SwiftUI

public protocol NoticeDetailDependency: Dependency {
    var inputNoticeFactory: any InputNoticeFactory { get }
    var postDomainFactory: any PostDomainFactory { get }
}

public final class NoticeDetailViewComponent: Component<NoticeDetailDependency>, NoticeDetailFactory {
    public func makeView(noticeID: String) -> some View {
        NoticeDetailView(
            viewModel: .init(
                noticeID: noticeID,
                fetchPostDetailUseCase: dependency.postDomainFactory.fetchPostDetailUseCase,
                deletePostUseCase: dependency.postDomainFactory.deletePostUseCase
            ),
            inputNoticeFactory: dependency.inputNoticeFactory
        )
    }
}
