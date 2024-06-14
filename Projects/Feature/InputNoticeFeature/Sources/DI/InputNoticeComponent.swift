import InputNoticeFeatureInterface
import NeedleFoundation
import NoticeDetailSettingFeatureInterface
import PostDomainInterface
import SwiftUI

public protocol InputNoticeDependency: Dependency {
    var noticeDetailSettingFactory: any NoticeDetailSettingFactory { get }
    var postDomainFactory: any PostDomainFactory { get }
}

public final class InputNoticeComponent: Component<InputNoticeDependency>, InputNoticeFactory {
    public func makeView(
        state: String,
        noticeID: String
    ) -> some View {
        InputNoticeView(
            viewModel: .init(
                state: state,
                noticeID: noticeID,
                fetchPostDetailUseCase: dependency.postDomainFactory.fetchPostDetailUseCase,
                writePostUseCase: dependency.postDomainFactory.writePostUseCase,
                updatePostUseCase: dependency.postDomainFactory.updatePostUseCase
            ),
            noticeDetailSettingFactory: dependency.noticeDetailSettingFactory
        )
    }
}
