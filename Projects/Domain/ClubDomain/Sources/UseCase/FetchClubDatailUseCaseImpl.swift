import ClubDomainInterface

struct FetchClubDatailUseCaseImpl: FetchClubDetailUseCase {
    private let clubRepository: any ClubRepository

    init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    func callAsFunction(clubID: Int) async throws -> ClubDetailEntity {
        try await clubRepository.fetchClubDetail(clubID: clubID)
    }
}
