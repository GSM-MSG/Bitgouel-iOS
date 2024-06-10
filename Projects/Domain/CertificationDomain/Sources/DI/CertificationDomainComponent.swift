import CertificationDomainInterface
import KeychainInterface
import NeedleFoundation

public protocol CertificationDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class CertificationDomainComponent: Component<CertificationDomainDependency>, CertificationDomainFactory {
    public var fetchCertificationListByTeacherUseCase: any FetchCertificationListByTeacherUseCase {
        FetchCertificationListByTeacherUseCaseImpl(certificationRepository: certificationRepository)
    }

    public var fetchCertificationListByStudentUseCase: any FetchCertificationListByStudentUseCase {
        FetchCertificationListByStudentUseCaseImpl(certificationRepository: certificationRepository)
    }

    public var inputCertificationUseCase: any InputCertificationUseCase {
        InputCertificationUseCaseImpl(certificationRepository: certificationRepository)
    }

    public var updateCertificationUseCase: any UpdateCertificationUseCase {
        UpdateCertificationUseCaseImpl(certificationRepository: certificationRepository)
    }

    public var certificationRepository: any CertificationRepository {
        CertificationRepositoryImpl(remoteCertificationDataSource: remoteCertificationDataSource)
    }

    var remoteCertificationDataSource: RemoteCertificationDataSource {
        RemoteCertificationDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
