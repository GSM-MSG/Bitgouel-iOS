import LectureDomainInterface

struct ModifyApplicantWhetherUseCaseImpl: ModifyApplicantWhetherUseCase {
    private let lectureRepository: any LectureRepository

    init(lectureRepository: any LectureRepository) {
        self.lectureRepository = lectureRepository
    }

    func callAsFunction(lectureID: String, studentID: String, isComplete: Bool) async throws {
        try await lectureRepository.modifyApplicantWhether(
            lectureID: lectureID,
            studentID: studentID,
            isComplete: isComplete
        )
    }
}
