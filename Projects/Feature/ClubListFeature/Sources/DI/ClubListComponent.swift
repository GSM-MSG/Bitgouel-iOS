import AuthDomainInterface
import BaseFeature
import ClubDetailFeatureInterface
import ClubDomainInterface
import ClubListFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol ClubListDependency: Dependency {
    var clubDetailFactory: any ClubDetailFactory { get }
    var clubDomainFactory: any ClubDomainFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
}

public final class ClubListComponent: Component<ClubListDependency>, ClubListFactory {
    public func makeView(selection: Binding<TabFlow>) -> some View {
        ClubListView(
            viewModel: .init(
                fetchClubListUseCase: dependency.clubDomainFactory.fetchClubListUseCase,
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase
            ),
            clubDetailFactory: dependency.clubDetailFactory,
            selection: selection
        )
    }
}
