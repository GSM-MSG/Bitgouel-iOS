import PostDomainInterface

struct DeletePostUseCaseImpl: DeletePostUseCase {
    private let postRepository: any PostRepository

    init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }

    func callAsFunction(postID: String) async throws {
        try await postRepository.deletePost(postID: postID)
    }
}
