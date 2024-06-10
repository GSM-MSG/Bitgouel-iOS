import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.EmailDomain.rawValue,
    targets: [
        .interface(module: .domain(.EmailDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.EmailDomain), dependencies: [
            .domain(target: .EmailDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.EmailDomain), dependencies: [
            .domain(target: .EmailDomain, type: .interface)
        ]),
        .tests(module: .domain(.EmailDomain), dependencies: [
            .domain(target: .EmailDomain),
            .domain(target: .EmailDomain, type: .testing)
        ])
    ]
)
