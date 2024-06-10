import LectureDomainInterface

struct FetchLectureDetailUseCaseImpl: FetchLectureDetailUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(lectureID: String) async throws -> LectureDetailEntity {
        try await lectureRepository.fetchLectureDetail(lectureID: lectureID)
    }
}
