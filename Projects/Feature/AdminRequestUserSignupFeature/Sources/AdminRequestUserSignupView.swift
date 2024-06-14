import AdminUserListFeatureInterface
import AdminWithdrawUserListFeatureInterface
import DesignSystem
import SwiftUI

struct AdminRequestUserSignupView: View {
    @StateObject var viewModel: AdminRequestUserSignupViewModel

    private let adminUserListFactory: any AdminUserListFactory
    private let adminWithdrawUserListFactory: any AdminWithdrawUserListFactory

    init(
        viewModel: AdminRequestUserSignupViewModel,
        adminUserListFactory: any AdminUserListFactory,
        adminWithdrawUserListFactory: any AdminWithdrawUserListFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.adminUserListFactory = adminUserListFactory
        self.adminWithdrawUserListFactory = adminWithdrawUserListFactory
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    optionButton(
                        buttonText: "전체 선택",
                        foregroundColor: .bitgouel(.greyscale(.g4))
                    ) {
                        if viewModel.isSelectedUserList {
                            viewModel.removeAllUserList()
                            viewModel.isSelectedUserList = false
                        } else {
                            viewModel.insertAllUserList()
                            viewModel.isSelectedUserList = true
                        }
                    }

                    optionButton(
                        buttonText: "선택 수락",
                        foregroundColor: .bitgouel(.primary(.p5))
                    ) {
                        viewModel.isShowingApproveAlert = true
                    }

                    optionButton(
                        buttonText: "선택 거절",
                        foregroundColor: .bitgouel(.error(.e5))
                    ) {
                        viewModel.isShowingRejectAlert = true
                    }
                }
                .padding(.top, 24)

                ScrollView {
                    if viewModel.userList.isEmpty {
                        NoInfoView(text: "가입 요청자가 없어요")
                    } else {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            ForEach(viewModel.userList, id: \.userID) { userInfo in
                                requestUserListRow(
                                    userID: userInfo.userID,
                                    userName: userInfo.name,
                                    userAuthority: userInfo.authority.display()
                                )

                                Divider()
                                    .frame(height: 1)
                                    .padding(.vertical, 14)
                            }
                        }
                    }
                }
                .padding(.top, 24)

                Spacer()
            }
            .onAppear {
                viewModel.onAppear()
            }
            .refreshable {
                viewModel.onAppear()
            }
            .padding(.horizontal, 28)
            .navigationTitle("가입 요청자 명단")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.isNavigateUserListDidTap = true
                    } label: {
                        BitgouelIcon(.people)
                    }

                    Button {
                        viewModel.isNavigateWithdrawListDidTap = true
                    } label: {
                        BitgouelIcon(.minusFill)
                    }
                }
            }
            .bitgouelAlert(
                title: "가입을 수락 하시겠습니까?",
                description: "",
                isShowing: $viewModel.isShowingApproveAlert,
                alertActions: [
                    .init(text: "취소", style: .cancel) {
                        viewModel.isShowingApproveAlert = false
                    },
                    .init(text: "수락", style: .default) {
                        viewModel.approveUserSignupButtonDidTap()
                        viewModel.isShowingApproveAlert = false
                    }
                ]
            )
            .bitgouelAlert(
                title: "가입을 거절 하시겠습니까?",
                description: "",
                isShowing: $viewModel.isShowingRejectAlert,
                alertActions: [
                    .init(text: "취소", style: .cancel) {
                        viewModel.isShowingRejectAlert = false
                    },
                    .init(text: "거절", style: .error) {
                        viewModel.rejectUserSignupButtonDidTap()
                        viewModel.isShowingRejectAlert = false
                    }
                ]
            )
        }
        .navigate(
            to: adminUserListFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateUserListDidTap },
                set: { _ in viewModel.userListPageDismissed() }
            )
        )
        .navigate(
            to: adminWithdrawUserListFactory.makeView().eraseToAnyView(),
            when: Binding(
                get: { viewModel.isNavigateWithdrawListDidTap },
                set: { _ in viewModel.withdrawListPageDismissed() }
            )
        )
        .bitgouelToast(
            text: viewModel.errorMessage,
            isShowing: $viewModel.isErrorOccurred
        )
    }

    @ViewBuilder
    func requestUserListRow(
        userID: String,
        userName: String,
        userAuthority: String
    ) -> some View {
        HStack(spacing: 8) {
            CheckButton(
                isSelected: Binding(
                    get: { viewModel.selectedUserList.contains(userID) },
                    set: { isSelected in
                        viewModel.insertUserList(userID: userID)
                        if !isSelected {
                            viewModel.removeUserList(userID: userID)
                        }
                    }
                )
            )

            BitgouelText(
                text: userName,
                font: .text1
            )

            BitgouelText(
                text: userAuthority,
                font: .text1
            )
            .foregroundColor(.bitgouel(.greyscale(.g6)))
        }
    }

    @ViewBuilder
    func optionButton(
        buttonText: String,
        foregroundColor: Color,
        action: @escaping () -> Void = {}
    ) -> some View {
        BitgouelText(
            text: buttonText,
            font: .text3
        )
        .foregroundColor(foregroundColor)
        .padding(.horizontal, 20)
        .padding(.vertical, 9)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(foregroundColor)
        }
        .buttonWrapper(action)
        .cornerRadius(8)
    }
}
