public protocol ApplyLectureUseCase {
    func callAsFunction(lectureID: String) async throws
}
