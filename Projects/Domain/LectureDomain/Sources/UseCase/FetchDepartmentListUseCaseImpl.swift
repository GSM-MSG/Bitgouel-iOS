import LectureDomainInterface

struct FetchDepartmentListUseCaseImpl: FetchDepartmentListUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(keyword: String) async throws -> [String] {
        try await lectureRepository.fetchDepartmentList(keyword: keyword)
    }
}
