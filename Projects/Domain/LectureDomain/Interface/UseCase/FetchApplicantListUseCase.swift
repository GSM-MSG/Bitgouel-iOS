public protocol FetchApplicantListUseCase {
    func callAsFunction(lectureID: String) async throws -> [ApplicantInfoEntity]
}
