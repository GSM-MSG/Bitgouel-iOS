import LectureDomainInterface

struct FetchAppliedLectureListUseCaseImpl: FetchAppliedLectureListUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(studentID: String) async throws -> [AppliedLectureEntity] {
        try await lectureRepository.fetchAppliedLectureList(studentID: studentID)
    }
}
