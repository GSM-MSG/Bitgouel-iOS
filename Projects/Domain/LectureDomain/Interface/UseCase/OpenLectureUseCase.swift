public protocol OpenLectureUseCase {
    func callAsFunction(req: OpenLectureRequestDTO) async throws
}
