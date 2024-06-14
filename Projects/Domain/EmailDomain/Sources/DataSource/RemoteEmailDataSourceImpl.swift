import BaseDomain
import EmailDomainInterface
import Foundation

final class RemoteEmailDataSourceImpl: BaseRemoteDataSource<EmailAPI>, RemoteEmailDataSource {
    func sendEmailCertificationLink(req: EmailRequestDTO) async throws {
        try await request(.sendEmailCertificationLink(req: req))
    }

    func fetchEmailVerificationStatus(email: String) async throws -> Bool {
        try await request(
            .fetchEmailVerificationStatus(email: email),
            dto: FetchEmailVerificationStatusResponseDTO.self
        ).isAuthentication
    }
}
