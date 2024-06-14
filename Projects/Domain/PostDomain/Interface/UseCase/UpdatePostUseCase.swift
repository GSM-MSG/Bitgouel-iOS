public protocol UpdatePostUseCase {
    func callAsFunction(postID: String, req: UpdatePostRequestDTO) async throws
}
