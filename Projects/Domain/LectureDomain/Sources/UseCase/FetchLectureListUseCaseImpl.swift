import LectureDomainInterface

struct FetchLectureListUseCaseImpl: FetchLectureListUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(type: String) async throws -> LectureContentEntity {
        try await lectureRepository.fetchLectureList(type: type)
    }
}
