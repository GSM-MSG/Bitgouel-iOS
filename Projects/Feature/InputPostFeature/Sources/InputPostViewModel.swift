import BaseFeature
import Foundation
import PostDomainInterface

final class InputPostViewModel: BaseViewModel {
    @Published var postTitle: String = ""
    @Published var postContent: String = ""
    @Published var postRelatedLink: [String] = []
    @Published var postDetail: PostDetailEntity?
    @Published var isPresentedPostDetailSettingAppend: Bool = false
    var state: String = ""
    var postID: String = ""

    private let writePostUseCase: any WritePostUseCase
    private let fetchPostDetailUseCase: any FetchPostDetailUseCase
    private let updatePostUseCase: any UpdatePostUseCase

    init(
        state: String,
        postID: String,
        writePostUseCase: any WritePostUseCase,
        updatePostUseCase: any UpdatePostUseCase,
        fetchPostDetailUseCase: any FetchPostDetailUseCase
    ) {
        self.state = state
        self.postID = postID
        self.writePostUseCase = writePostUseCase
        self.fetchPostDetailUseCase = fetchPostDetailUseCase
        self.updatePostUseCase = updatePostUseCase
    }

    func updatePostTitle(title: String) {
        postTitle = title
    }

    func updatePostContent(content: String) {
        postContent = content
    }

    func updatePostLinks(links: [String]) {
        postRelatedLink = links
    }

    func updateIsPresentedPostDetailSettingAppend(isPresented: Bool) {
        isPresentedPostDetailSettingAppend = isPresented
    }

    func updatePostDetail(postDetail: PostDetailEntity) {
        updatePostTitle(title: postDetail.title)
        updatePostContent(content: postDetail.content)
        updatePostLinks(links: postDetail.links)
    }

    @MainActor
    func onAppear() {
        isLoading = true

        Task {
            do {
                postDetail = try await fetchPostDetailUseCase(postID: postID)

                guard let postDetail else { return }
                updatePostDetail(postDetail: postDetail)
                isLoading = false
            } catch {
                errorMessage = error.postDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func applyButtonDidTap(_ success: @escaping () -> Void) {
        Task {
            do {
                switch state {
                case "추가":
                    try await addPost()

                case "수정":
                    try await updatePost()

                default:
                    return
                }

                success()
            } catch {
                errorMessage = error.postDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    func addPost() async throws {
        return try await writePostUseCase(
            req: InputPostRequestDTO(
                title: postTitle,
                content: postContent,
                links: postRelatedLink,
                feedType: .employment
            )
        )
    }

    func updatePost() async throws {
        return try await updatePostUseCase(
            postID: postID,
            req: UpdatePostRequestDTO(
                title: postTitle,
                content: postContent,
                links: postRelatedLink
            )
        )
    }
}
