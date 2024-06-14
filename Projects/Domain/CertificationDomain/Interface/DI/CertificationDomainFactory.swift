public protocol CertificationDomainFactory {
    var fetchCertificationListByTeacherUseCase: any FetchCertificationListByTeacherUseCase { get }
    var fetchCertificationListByStudentUseCase: any FetchCertificationListByStudentUseCase { get }
    var inputCertificationUseCase: any InputCertificationUseCase { get }
    var updateCertificationUseCase: any UpdateCertificationUseCase { get }
    var certificationRepository: any CertificationRepository { get }
}
