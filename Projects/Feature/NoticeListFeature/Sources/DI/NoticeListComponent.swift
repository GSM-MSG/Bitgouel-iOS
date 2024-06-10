import AuthDomainInterface
import InputNoticeFeatureInterface
import InquiryListFeatureInterface
import NeedleFoundation
import NoticeDetailFeatureInterface
import NoticeListFeatureInterface
import PostDomainInterface
import SwiftUI

public protocol NoticeListDependency: Dependency {
    var inquiryListFactory: any InquiryListFactory { get }
    var noticeDetailFactory: any NoticeDetailFactory { get }
    var inputNoticeFactory: any InputNoticeFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
    var postDomainFactory: any PostDomainFactory { get }
}

public final class NoticeListComponent: Component<NoticeListDependency>, NoticeListFactory {
    public func makeview() -> some View {
        NoticeListView(
            viewModel: .init(
                fetchPostListUseCase: dependency.postDomainFactory.fetchPostListUseCase,
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase
            ),
            inquiryListFactory: dependency.inquiryListFactory,
            noticeDetailFactory: dependency.noticeDetailFactory,
            inputNoticeFactory: dependency.inputNoticeFactory
        )
    }
}
