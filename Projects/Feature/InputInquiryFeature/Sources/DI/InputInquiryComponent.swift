import InputInquiryFeatureInterface
import InquiryDomainInterface
import NeedleFoundation
import SwiftUI

public protocol InputInquiryDependency: Dependency {
    var inquiryDomainFactory: any InquiryDomainFactory { get }
}

public final class InputInquiryComponent: Component<InputInquiryDependency>, InputInquiryFactory {
    @MainActor
    public func makeView(
        state: String,
        inquiryID: String
    ) -> some View {
        InputInquiryView(
            viewModel: .init(
                state: state,
                inquiryID: inquiryID,
                inputInquiryUseCase: dependency.inquiryDomainFactory.inputInquiryUseCase,
                modifyMyInquiryUseCase: dependency.inquiryDomainFactory.modifyMyInquiryUseCase,
                fetchInquiryDetailUseCase: dependency.inquiryDomainFactory.fetchInquiryDetailUseCase
            )
        )
    }
}
