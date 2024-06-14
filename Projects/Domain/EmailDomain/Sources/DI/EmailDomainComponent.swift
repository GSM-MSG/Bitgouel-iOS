import EmailDomainInterface
import KeychainInterface
import NeedleFoundation

public protocol EmailDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class EmailDomainComponent: Component<EmailDomainDependency>, EmailDomainFactory {
    public var sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase {
        SendEmailCertificationLinkUseCaseImpl(emailRepository: emailRepository)
    }

    public var fetchEmailVerificationStatusUseCase: any FetchEmailVertificationStatusUseCase {
        FetchEmailVerificationStatusUseCaseImpl(emailRepository: emailRepository)
    }

    public var emailRepository: any EmailRepository {
        EmailRepositoryImpl(remoteEmailDataSource: remoteEmailDataSource)
    }

    var remoteEmailDataSource: any RemoteEmailDataSource {
        RemoteEmailDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
