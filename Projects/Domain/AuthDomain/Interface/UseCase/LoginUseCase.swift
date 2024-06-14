public protocol LoginUseCase {
    func callAsFunction(req: LoginRequestDTO) async throws -> UserLoginEntity
}
