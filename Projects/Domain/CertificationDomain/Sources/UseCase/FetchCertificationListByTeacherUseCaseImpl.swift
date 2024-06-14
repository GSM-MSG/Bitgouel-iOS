import CertificationDomainInterface

// swiftlint: disable type_name
struct FetchCertificationListByTeacherUseCaseImpl: FetchCertificationListByTeacherUseCase {
    private let certificationRepository: any CertificationRepository

    init(certificationRepository: any CertificationRepository) {
        self.certificationRepository = certificationRepository
    }

    func callAsFunction(studentID: String) async throws -> [CertificationInfoEntity] {
        try await certificationRepository.fetchCertificationListByTeacher(studentID: studentID)
    }
}

// swiftlint: enable type_name
