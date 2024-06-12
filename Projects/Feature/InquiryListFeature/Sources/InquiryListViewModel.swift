import AuthDomainInterface
import BaseDomainInterface
import BaseFeature
import Foundation
import InquiryDomainInterface

final class InquiryListViewModel: BaseViewModel {
    @Published var authority: UserAuthorityType = .user
    @Published var inquiryList: [InquiryInfoEntity] = []
    @Published var answerStatus: AnswerStatusType?
    @Published var keyword: String = ""
    @Published var selectedAnswer: AnswerList = .all
    @Published var inquiryID: String = ""
    @Published var isPresentedFilter: Bool = false
    @Published var isPresentedInputInquiryView: Bool = false
    @Published var isPresentedInquiryDetailView: Bool = false
    var answerList: [AnswerList] = AnswerList.allCases

    private let loadUserAuthorityUseCase: any LoadUserAuthorityUseCase
    private let fetchMyInquiryListUseCase: any FetchMyInquiryListUseCase
    private let fetchInquiryListByAdminUseCase: any FetchInquiryListByAdminUseCase

    init(
        loadUserAuthorityUseCase: any LoadUserAuthorityUseCase,
        fetchMyInquiryListUseCase: any FetchMyInquiryListUseCase,
        fetchInquiryListByAdminUseCase: any FetchInquiryListByAdminUseCase
    ) {
        self.loadUserAuthorityUseCase = loadUserAuthorityUseCase
        self.fetchMyInquiryListUseCase = fetchMyInquiryListUseCase
        self.fetchInquiryListByAdminUseCase = fetchInquiryListByAdminUseCase
    }

    func updateInquiryID(inquiryID: String) {
        self.inquiryID = inquiryID
    }

    func updateIsPresentedInquiryDetailView(isPresented: Bool) {
        isPresentedInquiryDetailView = isPresented
    }

    func updateIsPresentedInputInquiryView(isPresented: Bool) {
        isPresentedInputInquiryView = isPresented
    }

    func updateIsPresentedFilter(isPresented: Bool) {
        isPresentedFilter = isPresented
    }

    func updateAnswerStatus(answer: AnswerList) {
        switch answer {
        case .all:
            answerStatus = nil

        case .answer:
            answerStatus = .answered

        case .unanswer:
            answerStatus = .unanswered
        }
    }

    @MainActor
    func onAppear() {
        authority = loadUserAuthorityUseCase()
        isLoading = true

        Task {
            do {
                let inquiryInfo: [InquiryInfoEntity] = try await { () async throws -> [InquiryInfoEntity] in
                    switch authority {
                    case .admin:
                        return try await onAppearInquiryByAdmin()

                    default:
                        return try await onAppearMyInquiry()
                    }
                }()

                updateContent(entity: inquiryInfo)
                isLoading = false
            } catch {
                errorMessage = error.inquiryDomainErrorMessage()
                isErrorOccurred = true
            }
        }
    }

    @MainActor
    func updateKeyword(text: String) {
        keyword = text
        onAppear()
    }

    func updateContent(entity: [InquiryInfoEntity]) {
        inquiryList = entity
    }

    func onAppearInquiryByAdmin() async throws -> [InquiryInfoEntity] {
        return try await fetchInquiryListByAdminUseCase(
            answerStatus: answerStatus?.rawValue ?? "",
            keyword: keyword
        )
    }

    func onAppearMyInquiry() async throws -> [InquiryInfoEntity] {
        return try await fetchMyInquiryListUseCase()
    }
}
