import LectureDomainInterface

struct FetchInstructorListUseCaseImpl: FetchInstructorListUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(keyword: String) async throws -> [InstructorInfoEntity] {
        try await lectureRepository.fetchInstructorList(keyword: keyword)
    }
}
