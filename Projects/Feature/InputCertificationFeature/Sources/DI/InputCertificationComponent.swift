import CertificationDomainInterface
import InputCertificationFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputCertificationDependency: Dependency {
    var certificationDomainFactory: any CertificationDomainFactory { get }
}

public final class InputCertificationComponent: Component<InputCertificationDependency>, InputCertificationFactory {
    public func makeView(
        epic: String,
        certificationID: String,
        certificationName: String,
        acquisitionDate: Date
    ) -> some View {
        InputCertificationView(
            viewModel: .init(
                inputCertificationUseCase: dependency.certificationDomainFactory.inputCertificationUseCase,
                updateCertificationUseCase: dependency.certificationDomainFactory.updateCertificationUseCase,
                epic: epic,
                certificationID: certificationID,
                certificationName: certificationName,
                acquisitionDate: acquisitionDate
            )
        )
    }
}
