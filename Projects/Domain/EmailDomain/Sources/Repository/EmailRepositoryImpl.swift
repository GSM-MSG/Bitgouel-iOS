import EmailDomainInterface

struct EmailRepositoryImpl: EmailRepository {
    private let remoteEmailDataSource: any RemoteEmailDataSource

    init(remoteEmailDataSource: any RemoteEmailDataSource) {
        self.remoteEmailDataSource = remoteEmailDataSource
    }

    func sendEmailCertificationLink(req: EmailRequestDTO) async throws {
        try await remoteEmailDataSource.sendEmailCertificationLink(req: req)
    }

    func fetchEmailVerificationStatus(email: String) async throws -> Bool {
        try await remoteEmailDataSource.fetchEmailVerificationStatus(email: email)
    }
}
