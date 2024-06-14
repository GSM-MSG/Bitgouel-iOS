import PostDomainInterface

struct WritePostUseCaseImpl: WritePostUseCase {
    private let postRepository: any PostRepository

    init(postRepository: any PostRepository) {
        self.postRepository = postRepository
    }

    func callAsFunction(req: InputPostRequestDTO) async throws {
        try await postRepository.writePost(req: req)
    }
}
