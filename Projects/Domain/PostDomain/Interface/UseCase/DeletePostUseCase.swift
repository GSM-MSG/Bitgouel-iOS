public protocol DeletePostUseCase {
    func callAsFunction(postID: String) async throws
}
