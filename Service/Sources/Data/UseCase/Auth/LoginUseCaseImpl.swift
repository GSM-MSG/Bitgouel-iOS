import Foundation

public struct LoginUseCaseImpl: LoginUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: LoginRequestDTO) async throws {
        try await authRepository.login(req: req)
    }
}