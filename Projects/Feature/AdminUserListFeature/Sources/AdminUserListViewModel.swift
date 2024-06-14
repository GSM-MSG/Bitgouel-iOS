import AdminDomainInterface
import BaseDomainInterface
import BaseFeature
import Foundation

final class AdminUserListViewModel: BaseViewModel {
    @Published var keyword = ""
    @Published var isSelectedUserList = false
    @Published var isPresentedUserTypeFilter: Bool = false
    @Published var isNavigateRequestSignUpDidTap = false
    @Published var isNavigateWithdrawListDidTap = false
    @Published var selectedAuthority: AdminUserListAuthorityType?
    @Published var userList: [UserInfoEntity] = []

    private let fetchUserListUseCase: any FetchUserListUseCase

    var userAuthorityType: [AdminUserListAuthorityType] = AdminUserListAuthorityType.allCases

    init(
        fetchUserListUseCase: any FetchUserListUseCase
    ) {
        self.fetchUserListUseCase = fetchUserListUseCase
    }

    func updateIsPresentedUserTypeFilter(isPresented: Bool) {
        isPresentedUserTypeFilter = isPresented
    }

    @MainActor
    func onAppear() {
        Task {
            do {
                userList = try await fetchUserListUseCase(
                    keyword: keyword,
                    authority: selectedAuthority?.rawValue ?? "",
                    approveStatus: ""
                )
            } catch {
                errorMessage = error.adminDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func requestSignUpPageDismissed() {
        isNavigateRequestSignUpDidTap = false
    }

    @MainActor
    func withdrawListPageDismissed() {
        isNavigateWithdrawListDidTap = false
    }
}
