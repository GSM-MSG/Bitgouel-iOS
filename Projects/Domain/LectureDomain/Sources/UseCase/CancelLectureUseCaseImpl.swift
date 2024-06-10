import LectureDomainInterface

struct CancelLectureUseCaseImpl: CancelLectureUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(lectureID: String) async throws {
        try await lectureRepository.cancelLecture(lectureID: lectureID)
    }
}
