import AuthDomainInterface
import BaseDomainInterface
import BaseFeature
import LectureDomainInterface
import SwiftUI

final class LectureListViewModel: BaseViewModel {
    @Published var selectedLectureType: String = ""
    @Published var filteredLectureList: [LectureType] = []
    @Published var isNavigateLectureDetailDidTap = false
    @Published var authority: UserAuthorityType = .user
    @Published var lectureList: LectureContentEntity?
    @Published var selectedLectureID: String?
    @Published var isPresentedLectureDetailView: Bool = false
    @Published var isPresentedOpenLectureView: Bool = false
    @Published var type: LectureType?
    @Published var isShowingLoginAlert: Bool = false

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchLectureListUseCase: any FetchLectureListUseCase
    let lectureType: [LectureType] = LectureType.allCases
    let approveStatusType: [ApproveStatusType] = ApproveStatusType.allCases

    init(
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchLectureListUseCase: any FetchLectureListUseCase
    ) {
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchLectureListUseCase = fetchLectureListUseCase
    }

    func updateType(lectureType: String) {
        switch lectureType {
        case "상호학점인정교육과정":
            return type = .mutualCreditRecognitionProgram

        case "대학탐방프로그램":
            return type = .universityExplorationProgram

        case "유관기관프로그램":
            return type = .governmentProgram

        case "기업산학연계직업체험프로그램":
            return type = .companyIndustryLinkingJobExperienceProgram

        default:
            return type = nil
        }
    }

    func updateIsPresentedOpenLectureView(isPresented: Bool) {
        isPresentedOpenLectureView = isPresented
    }

    func updateContent(entity: LectureContentEntity) {
        self.lectureList = entity
    }

    func updateSelectedLectureID(lectureID: String) {
        self.selectedLectureID = lectureID
    }

    func updateIsShowingLoginAlert(isShowing: Bool) {
        isShowingLoginAlert = isShowing
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        isLoading = true

        switch authority {
        case .user:
            updateIsShowingLoginAlert(isShowing: true)

        default:
            Task {
                do {
                    let response = try await fetchLectureListUseCase(type: type?.rawValue ?? "")

                    updateContent(entity: response)
                    isLoading = false
                } catch {
                    errorMessage = error.lectureDomainErrorMessage()
                    isErrorOccurred = true
                }
            }
        }
    }

    func updateIsPresentedLectureDetailView(isPresented: Bool) {
        isPresentedLectureDetailView = isPresented
    }

    func filteredLectureType(_ filterType: LectureType) {
        filteredLectureList = lectureType.filter { lecture in
            return lecture.rawValue == selectedLectureType
        }
    }
}
