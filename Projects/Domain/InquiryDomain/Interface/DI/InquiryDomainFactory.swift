public protocol InquiryDomainFactory {
    var inputInquiryUseCase: any InputInquiryUseCase { get }
    var fetchMyInquiryListUseCase: any FetchMyInquiryListUseCase { get }
    var fetchInquiryDetailUseCase: any FetchInquiryDetailUseCase { get }
    var deleteMyInquiryUseCase: any DeleteMyInquiryUseCase { get }
    var modifyMyInquiryUseCase: any ModifyMyInquiryUseCase { get }
    var replyInquiryUseCase: any ReplyInquiryUseCase { get }
    var fetchInquiryListByAdminUseCase: any FetchInquiryListByAdminUseCase { get }
    var deleteInquiryByAdminUseCase: any DeleteInquiryByAdminUseCase { get }
    var inquiryRepository: any InquiryRepository { get }
}
