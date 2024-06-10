import CertificationDomainInterface

// swiftlint: disable type_name
struct FetchCertificationListByStudentUseCaseImpl: FetchCertificationListByStudentUseCase {
    private let certificationRepository: any CertificationRepository

    init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }

    func callAsFunction() async throws -> [CertificationInfoEntity] {
        try await certificationRepository.fetchCertificationListByStudent()
    }
}

// swiftlint: enable type_name
