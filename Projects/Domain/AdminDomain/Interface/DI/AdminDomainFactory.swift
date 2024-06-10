public protocol AdminDomainFactory {
    var fetchUserListUseCase: any FetchUserListUseCase { get }
    var fetchUserDetailUseCase: any FetchUserDetailUseCase { get }
    var approveUserSignupUseCase: any ApproveUserSignupUseCase { get }
    var rejectUserSignupUseCase: any RejectUserSignupUseCase { get }
    var withdrawUserUseCase: any WithdrawUserUseCase { get }
    var adminRepository: any AdminRepository { get }
}
