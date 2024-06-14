import InquiryDomainInterface
import KeychainInterface
import NeedleFoundation

public protocol InquiryDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class InquiryDomainComponent: Component<InquiryDomainDependency>, InquiryDomainFactory {
    public var inputInquiryUseCase: any InputInquiryUseCase {
        InputInquiryUseCaseImpl(inquiryRepository: inquiryRepository)
    }

    public var fetchMyInquiryListUseCase: any FetchMyInquiryListUseCase {
        FetchMyInquiryListUseCaseImpl(inquiryRepository: inquiryRepository)
    }

    public var fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase {
        FetchInquiryDetailUseCaseImpl(inquiryRepository: inquiryRepository)
    }

    public var deleteMyInquiryUseCase: any DeleteMyInquiryUseCase {
        DeleteMyInquiryUseCaseImpl(inquiryRepository: inquiryRepository)
    }

    public var modifyMyInquiryUseCase: any ModifyMyInquiryUseCase {
        ModifyMyInquiryUseCaseImpl(inquiryRepository: inquiryRepository)
    }

    public var replyInquiryUseCase: any ReplyInquiryUseCase {
        ReplyInquiryUseCaseImpl(inquiryRepository: inquiryRepository)
    }

    public var fetchInquiryListByAdminUseCase: any FetchInquiryListByAdminUseCase {
        FetchInquiryListByAdminUseCaseImpl(inquiryRepository: inquiryRepository)
    }

    public var deleteInquiryByAdminUseCase: any DeleteInquiryByAdminUseCase {
        DeleteInquiryByAdminUseCaseImpl(inquiryRepository: inquiryRepository)
    }

    public var inquiryRepository: any InquiryRepository {
        InquiryRepositoryImpl(remoteInquiryDataSource: remoteInquiryDataSource)
    }

    var remoteInquiryDataSource: any RemoteInquiryDataSource {
        RemoteInquiryDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
