import LectureDomainInterface

struct ApplyLectureUseCaseImpl: ApplyLectureUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(lectureID: String) async throws {
        try await lectureRepository.applyLecture(lectureID: lectureID)
    }
}
