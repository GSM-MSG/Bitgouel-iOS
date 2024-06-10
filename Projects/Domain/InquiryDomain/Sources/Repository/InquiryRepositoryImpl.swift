import InquiryDomainInterface

struct InquiryRepositoryImpl: InquiryRepository {
    private let remoteInquiryDataSource: RemoteInquiryDataSource

    init(remoteInquiryDataSource: RemoteInquiryDataSource) {
        self.remoteInquiryDataSource = remoteInquiryDataSource
    }

    func inputInquiry(req: InputInquiryRequestDTO) async throws {
        try await remoteInquiryDataSource.inputInquiry(req: req)
    }

    func fetchMyInquiryList() async throws -> [InquiryInfoEntity] {
        try await remoteInquiryDataSource.fetchMyInquiryList()
    }

    func fetchInquiryDetail(inquiryID: String) async throws -> InquiryDetailEntity {
        try await remoteInquiryDataSource.fetchInquiryDetail(inquiryID: inquiryID)
    }

    func deleteMyInquiry(inquiryID: String) async throws {
        try await remoteInquiryDataSource.deleteMyInquiry(inquiryID: inquiryID)
    }

    func modifyMyInquiry(inquiryID: String, req: InputInquiryRequestDTO) async throws {
        try await remoteInquiryDataSource.modifyMyInquiry(inquiryID: inquiryID, req: req)
    }

    func replyInquiry(inquiryID: String, req: InquiryAnswerRequestDTO) async throws {
        try await remoteInquiryDataSource.replyInquiry(inquiryID: inquiryID, req: req)
    }

    func fetchInquiryListByAdmin(
        answerStatus: String,
        keyword: String
    ) async throws -> [InquiryInfoEntity] {
        try await remoteInquiryDataSource.fetchInquiryListByAdmin(answerStatus: answerStatus, keyword: keyword)
    }

    func deleteInquiryByAdmin(inquiryID: String) async throws {
        try await remoteInquiryDataSource.deleteInquiryByAdmin(inquiryID: inquiryID)
    }
}
