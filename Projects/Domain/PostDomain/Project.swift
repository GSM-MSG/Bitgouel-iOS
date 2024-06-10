import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.PostDomain.rawValue,
    targets: [
        .interface(module: .domain(.PostDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.PostDomain), dependencies: [
            .domain(target: .PostDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.PostDomain), dependencies: [
            .domain(target: .PostDomain, type: .interface)
        ]),
        .tests(module: .domain(.PostDomain), dependencies: [
            .domain(target: .PostDomain),
            .domain(target: .PostDomain, type: .testing)
        ])
    ]
)
