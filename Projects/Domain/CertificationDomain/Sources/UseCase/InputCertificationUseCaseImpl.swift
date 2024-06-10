import CertificationDomainInterface

struct InputCertificationUseCaseImpl: InputCertificationUseCase {
    private let certificationRepository: any CertificationRepository

    init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }

    func callAsFunction(req: InputCertificationRequestDTO) async throws {
        try await certificationRepository.inputCertification(req: req)
    }
}
