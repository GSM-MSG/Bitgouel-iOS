import ClubDomainInterface

struct FetchStudentDetailByClubUseCaseImpl: FetchStudentDetailByClubUseCase {
    private let clubRepository: any ClubRepository

    init(clubRepository: any ClubRepository) {
        self.clubRepository = clubRepository
    }

    func callAsFunction(clubID: Int, studentID: String) async throws -> StudentDetailByClubEntity {
        try await clubRepository.fetchStudentDetailByClub(clubID: clubID, studentID: studentID)
    }
}
