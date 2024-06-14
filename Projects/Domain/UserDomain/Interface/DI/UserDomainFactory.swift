public protocol UserDomainFactory {
    var changePasswordUseCase: any ChangePasswordUseCase { get }
    var fetchMyInfoUseCase: any FetchMyInfoUseCase { get }
    var userRepository: any UserRepository { get }
}
