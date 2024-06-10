import AuthDomainInterface
import InputInquiryFeatureInterface
import InquiryDetailFeatureInterface
import InquiryDomainInterface
import NeedleFoundation
import SwiftUI
import WriteInquiryAnswerFeatureInterface

public protocol InquiryDetailDependency: Dependency {
    var inputInquiryFactory: any InputInquiryFactory { get }
    var writeInquiryAnswerFactory: any WriteInquiryAnswerFactory { get }
    var inquiryDomainFactory: any InquiryDomainFactory { get }
    var authDomainFactory: any AuthDomainFactory { get }
}

public final class InquiryDetailComponent: Component<InquiryDetailDependency>, InquiryDetailFactory {
    public func makeView(inquiryID: String) -> some View {
        InquiryDetailView(
            viewModel: .init(
                inquiryID: inquiryID,
                fetchInquiryDetailUseCase: dependency.inquiryDomainFactory.fetchInquiryDetailUseCase,
                loadUserAuthorityUseCase: dependency.authDomainFactory.loadUserAuthorityUseCase,
                deleteMyInquiryUseCase: dependency.inquiryDomainFactory.deleteMyInquiryUseCase,
                deleteInquiryByAdminUseCase: dependency.inquiryDomainFactory.deleteInquiryByAdminUseCase
            ),
            inputInquiryFactory: dependency.inputInquiryFactory,
            writeInquiryAnswerFactory: dependency.writeInquiryAnswerFactory
        )
    }
}
