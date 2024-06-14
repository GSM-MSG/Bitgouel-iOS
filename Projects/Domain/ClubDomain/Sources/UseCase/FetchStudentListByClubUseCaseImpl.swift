import ClubDomainInterface

struct FetchStudentListByClubUseCaseImpl: FetchStudentListByClubUseCase {
    private let clubRepository: any ClubRepository

    init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    func callAsFunction() async throws -> ClubDetailEntity {
        try await clubRepository.fetchStudentListByClub()
    }
}
