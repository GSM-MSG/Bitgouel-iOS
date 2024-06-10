import InquiryDomainInterface
import NeedleFoundation
import SwiftUI
import WriteInquiryAnswerFeatureInterface

public protocol WriteInquiryAnswerDependency: Dependency {
    var inquiryDomainFactory: any InquiryDomainFactory { get }
}

public final class WriteInquiryAnswerComponent: Component<WriteInquiryAnswerDependency>, WriteInquiryAnswerFactory {
    public func makeView(inquiryID: String) -> some View {
        WriteInquiryAnswerView(
            viewModel: .init(
                inquiryID: inquiryID,
                replyInquiryUseCase: dependency.inquiryDomainFactory.replyInquiryUseCase
            )
        )
    }
}
