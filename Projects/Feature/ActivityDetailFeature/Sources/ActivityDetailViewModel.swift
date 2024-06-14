import ActivityDomainInterface
import AuthDomainInterface
import BaseDomainInterface
import BaseFeature
import Foundation

final class ActivityDetailViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var isDelete: Bool = false
    @Published var activityDetail: ActivityDetailEntity?
    @Published var isPresentedInputActivityView: Bool = false

    var activityID: String
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchActivityDetailUseCase: any FetchActivityDetailUseCase
    private let deleteActivityUseCase: any DeleteActivityUseCase

    init(
        activityID: String,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchActivityDetailUseCase: any FetchActivityDetailUseCase,
        deleteActivityUseCase: any DeleteActivityUseCase
    ) {
        self.activityID = activityID
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchActivityDetailUseCase = fetchActivityDetailUseCase
        self.deleteActivityUseCase = deleteActivityUseCase
    }

    func updateIsDelete(state: Bool) {
        isDelete = state
    }

    func updateIsPresentedInputActivityView(isPresented: Bool) {
        isPresentedInputActivityView = isPresented
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        isLoading = true

        Task {
            do {
                activityDetail = try await fetchActivityDetailUseCase(activityID: activityID)

                isLoading = false
            } catch {
                errorMessage = error.activityDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func deleteActivity(_ success: @escaping () -> Void) {
        Task {
            do {
                try await deleteActivityUseCase(activityID: activityID)

                success()
            } catch {
                errorMessage = error.activityDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
