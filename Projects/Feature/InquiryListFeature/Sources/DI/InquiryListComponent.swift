import AuthDomainInterface
import InputInquiryFeatureInterface
import InquiryDetailFeatureInterface
import InquiryDomainInterface
import InquiryListFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InquiryListDependency: Dependency {
    var inputInquiryFactory: any InputInquiryFactory { get }
    var inquiryDetailFactory: any InquiryDetailFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
    var inquiryDomainFactory: any InquiryDomainFactory { get }
}

public final class InquiryListComponent: Component<InquiryListDependency>, InquiryListFactory {
    public func makeView() -> some View {
        InquiryListView(
            viewModel: .init(
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                fetchMyInquiryListUseCase: dependency.inquiryDomainFactory.fetchMyInquiryListUseCase,
                fetchInquiryListByAdminUseCase: dependency.inquiryDomainFactory.fetchInquiryListByAdminUseCase
            ),
            inputInquiryFactory: dependency.inputInquiryFactory,
            inquiryDetailFactory: dependency.inquiryDetailFactory
        )
    }
}
