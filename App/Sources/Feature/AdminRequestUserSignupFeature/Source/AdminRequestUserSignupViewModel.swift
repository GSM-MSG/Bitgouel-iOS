import Foundation

final class AdminRequestUserSignupViewModel: BaseViewModel {
    @Published var isAppeove: Bool = false
    @Published var isReject: Bool = false
    @Published var isSelectedUserList = false
    @Published var isNavigateUserListDidTap = false
    @Published var isNavigateWithdrawListDidTap = false
    
    private let adminUserListFactory: any adminUserListFactory
    private let adminWithdrawUserListFactory: any AdminWithdrawUserListFactory
    
    init(
        adminUserListFactory: any adminUserListFactory,
        adminWithdrawUserListFactory: any AdminWithdrawUserListFactory
    ) {
        self.adminUserListFactory = adminUserListFactory
        self.adminWithdrawUserListFactory = adminWithdrawUserListFactory
    }
    
    @MainActor
    func userListPageDismissed() {
        isNavigateUserListDidTap = false
    }
    
    @MainActor
    func withdrawListPageDismissed() {
        isNavigateWithdrawListDidTap = false
    }
}