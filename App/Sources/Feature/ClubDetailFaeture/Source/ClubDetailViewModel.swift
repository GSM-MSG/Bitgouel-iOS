import Service
import SwiftUI

final class ClubDetailViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var isPresentedCertificationView: Bool = false
    @Published var studentID: String = ""

    // MARK: ClubInfo
    var clubID: Int = 0
    @Published var clubName: String = ""
    @Published var highSchoolName: String = ""
    @Published var students: [ClubDetailEntity.MemberInfoEntity] = []
    @Published var teacher: ClubDetailEntity.MemberInfoEntity?

    // MARK: UseCase
    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let queryClubDetailUseCase: any QueryClubDetailUseCase
    private let queryStudentListByClubUseCase: any QueryStudentListByClubUseCase

    init(
        clubID: Int,
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        queryClubDetailUseCase: any QueryClubDetailUseCase,
        queryStudentListByClubUseCase: any QueryStudentListByClubUseCase
    ) {
        self.clubID = clubID
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.queryClubDetailUseCase = queryClubDetailUseCase
        self.queryStudentListByClubUseCase = queryStudentListByClubUseCase
    }

    @MainActor
    func onAppear() {
        self.authority = loadUserAuthorityUseCase()
        print("authority: \(authority)")

        Task {
            do {
                let clubDetail: ClubDetailEntity = try await { () async throws -> ClubDetailEntity in
                    switch authority {
                    case .admin: return try await onAppearClubDetailByAdmin(clubID: clubID)
                    default: return try await onAppearClubDetail()
                    }
                }()
                print("정보 \(clubDetail)")

                updateClubDetail(clubInfo: clubDetail)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func onAppearClubDetailByAdmin(clubID: Int) async throws -> ClubDetailEntity {
        return try await queryClubDetailUseCase(clubID: clubID)
    }

    func onAppearClubDetail() async throws -> ClubDetailEntity {
        return try await queryStudentListByClubUseCase()
    }

    func updateClubDetail(clubInfo: ClubDetailEntity) {
        self.clubID = clubInfo.clubID
        self.clubName = clubInfo.clubName
        self.highSchoolName = clubInfo.highSchoolName
        self.students = clubInfo.students
        self.teacher = clubInfo.teacher
    }

    func updateIsPresentedCertificationView(isPresented: Bool) {
        isPresentedCertificationView = isPresented
    }
}
