import AuthDomainInterface
import BaseDomainInterface
import BaseFeature
import ClubDomainInterface
import Foundation

final class ClubListViewModel: BaseViewModel {
    @Published var selectedSchool: HighSchoolType?
    @Published var isPresentedSelectedSchoolPopup: Bool = false
    @Published var isPresentedClubDetailView: Bool = false
    @Published var isShowingLoginAlert: Bool = false
    @Published var clubList: [ClubEntity] = []
    @Published var clubID: Int = 0
    var schoolList: [HighSchoolType] = HighSchoolType.allCases
    var authority: UserAuthorityType = .user

    private let fetchClubListUseCase: any FetchClubListUseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase

    init(
        fetchClubListUseCase: any FetchClubListUseCase,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    ) {
        self.fetchClubListUseCase = fetchClubListUseCase
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
    }

    func updateClubID(clubID: Int) {
        self.clubID = clubID
    }

    func updateIsShowingLoginAlert(isShowing: Bool) {
        isShowingLoginAlert = isShowing
    }

    func onAppear() {
        authority = loadUserAuthorityUseCase()

        switch authority {
        case .admin:
            isPresentedSelectedSchoolPopup = true

        case .user:
            updateIsShowingLoginAlert(isShowing: true)

        default:
            isPresentedClubDetailView = true
        }
    }

    @MainActor
    func fetchClubList() {
        Task {
            do {
                guard let selectedSchool else { return }

                clubList = try await fetchClubListUseCase(highSchool: selectedSchool.rawValue)
            } catch {
                errorMessage = error.clubDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }
}
