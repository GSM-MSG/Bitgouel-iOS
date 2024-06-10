import LectureDomainInterface

struct FetchLineListUseCaseImpl: FetchLineListUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(keyword: String, division: String) async throws -> [String] {
        try await lectureRepository.fetchLineList(keyword: keyword, division: division)
    }
}
