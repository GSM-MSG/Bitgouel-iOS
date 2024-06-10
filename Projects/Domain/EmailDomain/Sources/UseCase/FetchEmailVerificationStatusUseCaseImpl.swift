import EmailDomainInterface

struct FetchEmailVerificationStatusUseCaseImpl: FetchEmailVertificationStatusUseCase {
    private let emailRepository: any EmailRepository

    init(emailRepository: any EmailRepository) {
        self.emailRepository = emailRepository
    }

    func callAsFunction(email: String) async throws -> Bool {
        try await emailRepository.fetchEmailVerificationStatus(email: email)
    }
}
