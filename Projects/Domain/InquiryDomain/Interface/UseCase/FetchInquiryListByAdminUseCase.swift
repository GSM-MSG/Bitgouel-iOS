public protocol FetchInquiryListByAdminUseCase {
    func callAsFunction(answerStatus: String, keyword: String) async throws -> [InquiryInfoEntity]
}
