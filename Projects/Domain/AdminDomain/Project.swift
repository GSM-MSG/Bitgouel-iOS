import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.AdminDomain.rawValue,
    targets: [
        .interface(module: .domain(.AdminDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.AdminDomain), dependencies: [
            .domain(target: .AdminDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.AdminDomain), dependencies: [
            .domain(target: .AdminDomain, type: .interface)
        ]),
        .tests(module: .domain(.AdminDomain), dependencies: [
            .domain(target: .AdminDomain),
            .domain(target: .AdminDomain, type: .testing)
        ])
    ]
)
