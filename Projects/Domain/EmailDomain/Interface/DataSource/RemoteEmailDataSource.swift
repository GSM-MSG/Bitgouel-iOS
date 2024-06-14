public protocol RemoteEmailDataSource {
    func sendEmailCertificationLink(req: EmailRequestDTO) async throws
    func fetchEmailVerificationStatus(email: String) async throws -> Bool
}
