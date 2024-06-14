import CertificationDomainInterface

struct UpdateCertificationUseCaseImpl: UpdateCertificationUseCase {
    private let certificationRepository: any CertificationRepository

    init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }

    func callAsFunction(certificationID: String, req: InputCertificationRequestDTO) async throws {
        try await certificationRepository.updateCertification(certificationID: certificationID, req: req)
    }
}
