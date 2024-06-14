import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.FAQDomain.rawValue,
    targets: [
        .interface(module: .domain(.FAQDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.FAQDomain), dependencies: [
            .domain(target: .FAQDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.FAQDomain), dependencies: [
            .domain(target: .FAQDomain, type: .interface)
        ]),
        .tests(module: .domain(.FAQDomain), dependencies: [
            .domain(target: .FAQDomain),
            .domain(target: .FAQDomain, type: .testing)
        ])
    ]
)
