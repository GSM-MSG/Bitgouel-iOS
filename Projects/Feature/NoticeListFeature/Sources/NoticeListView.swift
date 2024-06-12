import DateUtil
import DesignSystem
import InputNoticeFeatureInterface
import InquiryListFeatureInterface
import NoticeDetailFeatureInterface
import SwiftUI

struct NoticeListView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: NoticeListViewModel

    private let inquiryListFactory: any InquiryListFactory
    private let noticeDetailFactory: any NoticeDetailFactory
    private let inputNoticeFactory: any InputNoticeFactory

    init(
        viewModel: NoticeListViewModel,
        inquiryListFactory: any InquiryListFactory,
        noticeDetailFactory: any NoticeDetailFactory,
        inputNoticeFactory: any InputNoticeFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.inquiryListFactory = inquiryListFactory
        self.noticeDetailFactory = noticeDetailFactory
        self.inputNoticeFactory = inputNoticeFactory
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                if let noticeInfo = viewModel.noticeContent {
                    if noticeInfo.content.isEmpty {
                        NoInfoView(text: "공지사항이 없어요")
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 0) {
                                ForEach(noticeInfo.content, id: \.postID) { notice in
                                    ListRow(
                                        id: notice.postID,
                                        title: notice.title,
                                        modifiedAt: notice.modifiedAt
                                            .toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss.SSS")
                                    )
                                    .onTapGesture {
                                        viewModel.noticeID = notice.postID
                                        viewModel.updateIsPresentedNoticeDetailView(isPresented: true)
                                    }

                                    Divider()
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 28)
        .onAppear {
            viewModel.onAppear()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("공지사항")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    BitgouelIcon(.message)
                }

                Button {
                    viewModel.updateIsPresentedInquiryListView(isPresented: true)
                } label: {
                    BitgouelIcon(.questionmark)
                }

                if viewModel.authority == .admin {
                    Button {
                        viewModel.updateIsPresentedInputNoticeView(isPresented: true)
                    } label: {
                        BitgouelIcon(.plus)
                    }
                }
            }
        }
        .navigate(
            to: inquiryListFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInquiryListView },
                set: { isPresented in
                    viewModel.updateIsPresentedInquiryListView(isPresented: isPresented)
                }
            )
        )
        .navigate(
            to: noticeDetailFactory.makeView(noticeID: viewModel.noticeID).eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedNoticeDetailView },
                set: { isPresented in
                    viewModel.updateIsPresentedNoticeDetailView(isPresented: isPresented)
                }
            )
        )
        .onChange(of: viewModel.isPresentedNoticeDetailView) { newValue in
            tabbarHidden.wrappedValue = newValue
        }
        .navigate(
            to: inputNoticeFactory.makeView(state: "추가", noticeID: "").eraseToAnyView(),
            when: Binding(
                get: { viewModel.isPresentedInputNoticeView },
                set: { isPresented in
                    viewModel.updateIsPresentedInputNoticeView(isPresented: isPresented)
                }
            )
        )
        .onChange(of: viewModel.isPresentedInputNoticeView) { newValue in
            tabbarHidden.wrappedValue = newValue
        }
        .refreshable {
            viewModel.onAppear()
        }
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }
}
