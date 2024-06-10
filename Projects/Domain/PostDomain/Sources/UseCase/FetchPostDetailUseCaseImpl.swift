import PostDomainInterface

struct FetchPostDetailUseCaseImpl: FetchPostDetailUseCase {
    private let postRepository: any PostRepository

    init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }

    func callAsFunction(postID: String) async throws -> PostDetailEntity {
        try await postRepository.fetchPostDetail(postID: postID)
    }
}
