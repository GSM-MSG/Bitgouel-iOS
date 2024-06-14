import AuthDomainInterface
import BaseDomainInterface
import BaseFeature
import ClubDomainInterface
import SwiftUI
import UserDomainInterface

final class ClubDetailViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var userID: String = ""
    @Published var isPresentedStudentInfoView: Bool = false
    @Published var studentID: String = ""

    // MARK: ClubInfo
    var clubID: Int = 0
    @Published var clubName: String = ""
    @Published var highSchoolName: String = ""
    @Published var students: [ClubDetailEntity.MemberInfoEntity] = []
    @Published var teacher: ClubDetailEntity.TeacherInfoEntity?

    // MARK: UseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchClubDetailUseCase: any FetchClubDetailUseCase
    private let fetchStudentListByClubUseCase: any FetchStudentListByClubUseCase
    private let fetchMyInfoUseCase: any FetchMyInfoUseCase

    init(
        clubID: Int,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchClubDetailUseCase: any FetchClubDetailUseCase,
        fetchStudentListByClubUseCase: any FetchStudentListByClubUseCase,
        fetchMyInfoUseCase: any FetchMyInfoUseCase
    ) {
        self.clubID = clubID
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchClubDetailUseCase = fetchClubDetailUseCase
        self.fetchStudentListByClubUseCase = fetchStudentListByClubUseCase
        self.fetchMyInfoUseCase = fetchMyInfoUseCase
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        isLoading = true

        Task {
            do {
                let clubDetail = try await fetchClubDetail(authority: authority)
                updateClubDetail(clubInfo: clubDetail)

                let response = try await fetchMyInfoUseCase()
                userID = response.userID

                isLoading = false
            } catch {
                errorMessage = error.clubDomainErrorMessage()

                isErrorOccurred = true
            }
        }
    }

    func fetchClubDetail(authority: UserAuthorityType) async throws -> ClubDetailEntity {
        switch authority {
        case .admin:
            return try await fetchClubDetailUseCase(clubID: clubID)

        default:
            return try await fetchStudentListByClubUseCase()
        }
    }

    func updateClubDetail(clubInfo: ClubDetailEntity) {
        self.clubID = clubInfo.clubID
        self.clubName = clubInfo.clubName
        self.highSchoolName = clubInfo.highSchoolName
        self.students = clubInfo.students
        self.teacher = clubInfo.teacher
    }

    func updateIsPresentedStudentInfoView(isPresented: Bool) {
        isPresentedStudentInfoView = isPresented
    }

    func studentInfoRowDidTap(selectedStudentID: String) {
        studentID = selectedStudentID
        updateIsPresentedStudentInfoView(isPresented: true)
    }
}
