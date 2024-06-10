public protocol FetchClubDetailUseCase {
    func callAsFunction(clubID: Int) async throws -> ClubDetailEntity
}
