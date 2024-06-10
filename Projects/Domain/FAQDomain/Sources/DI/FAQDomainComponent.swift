import FAQDomainInterface
import KeychainInterface
import NeedleFoundation

public protocol FAQDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class FAQDomainComponent: Component<FAQDomainDependency>, FAQDomainFactory {
    public var inputFAQUseCase: any InputFAQUseCase {
        InputFAQUseCaseImpl(faqRepository: faqRepository)
    }

    public var fetchFAQListUseCase: any FetchFAQListUseCase {
        FetchFAQListUseCaseImpl(faqRepository: faqRepository)
    }

    public var faqRepository: any FAQRepository {
        FAQRepositoryImpl(remoteFAQDataSource: remoteFAQDataSource)
    }

    var remoteFAQDataSource: any RemoteFAQDataSource {
        RemoteFAQDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
