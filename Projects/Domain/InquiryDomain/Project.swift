import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.InquiryDomain.rawValue,
    targets: [
        .interface(module: .domain(.InquiryDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.InquiryDomain), dependencies: [
            .domain(target: .InquiryDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.InquiryDomain), dependencies: [
            .domain(target: .InquiryDomain, type: .interface)
        ]),
        .tests(module: .domain(.InquiryDomain), dependencies: [
            .domain(target: .InquiryDomain),
            .domain(target: .InquiryDomain, type: .testing)
        ])
    ]
)
