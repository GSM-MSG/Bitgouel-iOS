public protocol WithdrawUserUseCase {
    func callAsFunction(userID: String) async throws
}
