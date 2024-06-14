public protocol WithdrawDomainFactory {
    var fetchWithdrawUserListUseCase: any FetchWithdrawUserListUseCase { get }
    var withdrawRepository: any WithdrawRepository { get }
}
