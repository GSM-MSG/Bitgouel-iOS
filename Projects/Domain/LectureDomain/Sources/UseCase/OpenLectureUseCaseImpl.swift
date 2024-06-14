import LectureDomainInterface

struct OpenLectureUseCaseImpl: OpenLectureUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(req: OpenLectureRequestDTO) async throws {
        try await lectureRepository.openLecture(req: req)
    }
}
