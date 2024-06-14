import LectureDomainInterface

struct FetchApplicantListUseCaseImpl: FetchApplicantListUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(lectureID: String) async throws -> [ApplicantInfoEntity] {
        try await lectureRepository.fetchApplicantList(lectureID: lectureID)
    }
}
