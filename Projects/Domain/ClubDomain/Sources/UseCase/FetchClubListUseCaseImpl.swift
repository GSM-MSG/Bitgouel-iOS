import ClubDomainInterface

struct FetchClubListUseCaseImpl: FetchClubListUseCase {
    private let clubRepository: any ClubRepository

    init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    func callAsFunction(highSchool: String) async throws -> [ClubEntity] {
        try await clubRepository.fetchClubList(highSchool: highSchool)
    }
}
