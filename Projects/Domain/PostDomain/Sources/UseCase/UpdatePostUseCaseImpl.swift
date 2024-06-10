import PostDomainInterface

struct UpdatePostUseCaseImpl: UpdatePostUseCase {
    private let postRepository: any PostRepository

    init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }

    func callAsFunction(postID: String, req: UpdatePostRequestDTO) async throws {
        try await postRepository.updatePost(postID: postID, req: req)
    }
}
