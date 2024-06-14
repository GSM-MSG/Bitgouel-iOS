import AuthDomainInterface
import ClubDetailFeatureInterface
import ClubDomainInterface
import NeedleFoundation
import StudentInfoFeatureInterface
import SwiftUI
import UserDomainInterface

public protocol ClubdetailDependency: Dependency {
    var studentInfoFactory: any StudentInfoFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
    var clubDomainFactory: any ClubDomainFactory { get }
    var userDomainFactory: any UserDomainFactory { get }
}

public final class ClubDetailComponent: Component<ClubdetailDependency>, ClubDetailFactory {
    public func makeView(clubID: Int) -> some View {
        ClubDetailView(
            viewModel: .init(
                clubID: clubID,
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                fetchClubDetailUseCase: dependency.clubDomainFactory.fetchClubDetailUseCase,
                fetchStudentListByClubUseCase: dependency.clubDomainFactory.fetchStudentListByClubUseCase,
                fetchMyInfoUseCase: dependency.userDomainFactory.fetchMyInfoUseCase
            ),
            studentInfoFactory: dependency.studentInfoFactory
        )
    }
}
