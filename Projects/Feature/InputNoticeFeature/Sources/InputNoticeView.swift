import DesignSystem
import NoticeDetailSettingFeatureInterface
import SwiftUI

struct InputNoticeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: InputNoticeViewModel

    private let noticeDetailSettingFactory: any NoticeDetailSettingFactory

    init(
        viewModel: InputNoticeViewModel,
        noticeDetailSettingFactory: any NoticeDetailSettingFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.noticeDetailSettingFactory = noticeDetailSettingFactory
    }

    var body: some View {
        VStack(spacing: 0) {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                InputFormView(
                    epic: "공지사항",
                    state: viewModel.state,
                    settingButtonAction: {
                        viewModel.updateIsPresentedNoticeSettingAppend(isPresented: true)
                    },
                    finalButtonAction: {
                        viewModel.applyButtonDidTap {
                            dismiss()
                        }
                    },
                    title: Binding(
                        get: { viewModel.noticeTitle },
                        set: { title in viewModel.updateNoticeTitle(title: title) }
                    ),
                    text: Binding(
                        get: { viewModel.noticeContent },
                        set: { content in viewModel.updateNoticeContent(content: content) }
                    )
                )
            }
        }
        .onAppear {
            if viewModel.state == "수정" {
                viewModel.onAppear()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .fullScreenCover(
            isPresented: Binding(
                get: { viewModel.isPresentedNoticeDetailSettingAppend },
                set: { isPresented in
                    viewModel.updateIsPresentedNoticeSettingAppend(isPresented: isPresented)
                }
            )
        ) {
            DeferView {
                noticeDetailSettingFactory.makeView(noticeLinks: viewModel.noticeLinks) { links in
                    viewModel.updateNoticeLinks(links: links)
                }.eraseToAnyView()
            }
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }
}
