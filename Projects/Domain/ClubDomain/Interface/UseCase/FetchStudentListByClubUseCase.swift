public protocol FetchStudentListByClubUseCase {
    func callAsFunction() async throws -> ClubDetailEntity
}
