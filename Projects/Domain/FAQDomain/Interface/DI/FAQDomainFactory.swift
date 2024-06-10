public protocol FAQDomainFactory {
    var inputFAQUseCase: any InputFAQUseCase { get }
    var fetchFAQListUseCase: any FetchFAQListUseCase { get }
    var faqRepository: any FAQRepository { get }
}
