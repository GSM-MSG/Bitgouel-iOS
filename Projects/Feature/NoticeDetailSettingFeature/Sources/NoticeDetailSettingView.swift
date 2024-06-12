import DesignSystem
import SwiftUI

struct NoticeDetailSettingView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: NoticeDetailSettingViewModel

    init(viewModel: NoticeDetailSettingViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                LinkDetailSettingView(
                    links: viewModel.noticeLinks,
                    link: viewModel.link,
                    dismiss: dismiss
                ) { links in
                    viewModel.applyButtonDidTap(link: links)
                }
            }
            .padding(.horizontal, 28)
            .navigationTitle("공지사항 세부 설정")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        BitgouelIcon(.xmark)
                    }
                }
            }
        }
    }
}
