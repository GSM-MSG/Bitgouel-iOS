import AdminUserListFeatureInterface
import BaseFeature
import ChangePasswordFeatureInterface
import DesignSystem
import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel
    @EnvironmentObject var sceneState: SceneState
    @Environment(\.tabbarHidden) var tabbarHidden
    @Binding var selection: TabFlow

    private let changePasswordFactory: any ChangePasswordFactory
    private let adminUserListFactory: any AdminUserListFactory

    init(
        viewModel: MyPageViewModel,
        changePasswordFactory: any ChangePasswordFactory,
        adminUserListFactory: any AdminUserListFactory,
        selection: Binding<TabFlow>
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.changePasswordFactory = changePasswordFactory
        self.adminUserListFactory = adminUserListFactory
        _selection = selection
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 40) {
                if let myInfo = viewModel.myInfo {
                    ScrollView {
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack(spacing: 4) {
                                        BitgouelText(
                                            text: myInfo.name,
                                            font: .title2
                                        )

                                        BitgouelText(
                                            text: myInfo.authority.display(),
                                            font: .text1
                                        )
                                        .foregroundColor(.bitgouel(.greyscale(.g7)))
                                    }

                                    if viewModel.authority != .admin {
                                        HStack(spacing: 4) {
                                            BitgouelText(
                                                text: viewModel.userOrganization,
                                                font: .text1
                                            )

                                            BitgouelText(
                                                text: "소속",
                                                font: .text1
                                            )
                                            .foregroundColor(.bitgouel(.greyscale(.g7)))
                                        }

                                        LazyVStack(alignment: .leading, spacing: 4) {
                                            ForEach(viewModel.userInfo, id: \.self) { info in
                                                BitgouelText(
                                                    text: info,
                                                    font: .text3
                                                )
                                                .foregroundColor(.bitgouel(.greyscale(.g4)))
                                            }
                                        }
                                    }
                                }

                                Spacer()
                            }
                            .padding(.top, 32)

                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    BitgouelText(
                                        text: "계정 정보",
                                        font: .text1
                                    )

                                    BitgouelText(
                                        text: myInfo.email,
                                        font: .text3
                                    )
                                    .foregroundColor(.bitgouel(.greyscale(.g7)))

                                    BitgouelText(
                                        text: myInfo.phoneNumber,
                                        font: .text3
                                    )
                                    .foregroundColor(.bitgouel(.greyscale(.g7)))
                                }

                                Spacer()
                            }

                            if viewModel.authority == .admin {
                                adminUserListButton()
                            }

                            HStack {
                                VStack(alignment: .leading, spacing: 21) {
                                    BitgouelText(
                                        text: "계정 설정",
                                        font: .text1
                                    )

                                    Button {
                                        viewModel.updateIsPresentedChangePasswordView(isPresented: true)
                                    } label: {
                                        BitgouelText(
                                            text: "비밀번호 변경",
                                            font: .text3
                                        )
                                    }
                                    .padding(.top, 19)

                                    Divider()

                                    Button {
                                        viewModel.updateIsShowingLogoutAlert(isShowing: true)
                                    } label: {
                                        BitgouelText(
                                            text: "로그아웃",
                                            font: .text3
                                        )
                                    }

                                    Divider()

                                    Button {
                                        viewModel.updateIsShowingWithdrawAlert(isShowing: true)
                                    } label: {
                                        BitgouelText(
                                            text: "회원 탈퇴",
                                            font: .text3
                                        )
                                        .foregroundColor(.bitgouel(.error(.e5)))
                                    }
                                }

                                Spacer()
                            }
                            .padding(.top, 60)

                            Spacer()
                        }
                    }
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
            .navigationTitle("내 정보")
            .padding(.horizontal, 28)
            .navigate(
                to: changePasswordFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedChangePasswordView },
                    set: { isPresented in
                        viewModel.updateIsPresentedChangePasswordView(isPresented: isPresented)
                    }
                )
            )
            .onChange(of: viewModel.isPresentedChangePasswordView) { newValue in
                tabbarHidden.wrappedValue = newValue
            }
            .navigate(
                to: adminUserListFactory.makeView().eraseToAnyView(),
                when: Binding(
                    get: { viewModel.isPresentedAdminUserListView },
                    set: { isPresented in
                        viewModel.updateIsPresentedAdminUserListView(isPresented: isPresented)
                    }
                )
            )
            .onChange(of: viewModel.isPresentedAdminUserListView) { newValue in
                tabbarHidden.wrappedValue = newValue
            }
            .bitgouelAlert(
                title: "회원 탈퇴하시겠습니까?",
                description: "회원 탈퇴하면 계정을 복구할 수 없으며,\n    회원가입을 다시 진행해야 합니다!",
                isShowing: Binding(
                    get: { viewModel.isShowingWithdrawAlert },
                    set: { isShowing in
                        viewModel.updateIsShowingWithdrawAlert(isShowing: isShowing)
                    }
                ),
                alertActions: [
                    .init(
                        text: "취소",
                        style: .cancel,
                        action: { viewModel.updateIsShowingWithdrawAlert(isShowing: false) }
                    ),

                    .init(
                        text: "탈퇴",
                        style: .error
                    ) {
                        viewModel.withdraw {
                            sceneState.sceneFlow = .login
                        }
                    }
                ]
            )
            .loginAlert(
                isShowing: Binding(
                    get: { viewModel.isShowingLoginAlert },
                    set: { isShowing in
                        viewModel.updateIsShowingLoginAlert(isShowing: isShowing)
                    }
                ),
                cancelAction: {
                    $selection.wrappedValue = .home
                },
                loginAction: {
                    sceneState.sceneFlow = .login
                }
            )
            .bitgouelAlert(
                title: "로그아웃 하시겠습니까?",
                description: "  로그아웃 시 로그인을 통해서 \n다시 계정에 접속할 수 있습니다.",
                isShowing: Binding(
                    get: { viewModel.isShowingLogoutAlert },
                    set: { isShowing in
                        viewModel.updateIsShowingLogoutAlert(isShowing: isShowing)
                    }
                ),
                alertActions: [
                    .init(
                        text: "취소",
                        style: .cancel,
                        action: { viewModel.updateIsShowingLogoutAlert(isShowing: false) }
                    ),

                    .init(
                        text: "로그아웃",
                        style: .error
                    ) {
                        viewModel.logout {
                            sceneState.sceneFlow = .login
                        }
                    }
                ]
            )
            .bitgouelToast(
                text: viewModel.errorMessage,
                isShowing: $viewModel.isErrorOccurred
            )
        }
    }

    @ViewBuilder
    func adminUserListButton() -> some View {
        Button {
            viewModel.updateIsPresentedAdminUserListView(isPresented: true)
        } label: {
            BitgouelText(
                text: "사용자 명단 관리하기",
                font: .text3
            )
            .foregroundColor(.bitgouel(.error(.e5)))
        }
    }
}
