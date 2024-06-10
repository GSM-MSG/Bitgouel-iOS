import EmailDomainInterface

struct SendEmailCertificationLinkUseCaseImpl: SendEmailCertificationLinkUseCase {
    private let emailRepository: any EmailRepository

    init(emailRepository: any EmailRepository) {
        self.emailRepository = emailRepository
    }

    func callAsFunction(req: EmailRequestDTO) async throws {
        try await emailRepository.sendEmailCertificationLink(req: req)
    }
}
