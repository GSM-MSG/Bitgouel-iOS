import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.ActivityDomain.rawValue,
    targets: [
        .interface(module: .domain(.ActivityDomain), dependencies: []),
        .implements(module: .domain(.ActivityDomain), dependencies: [
            .domain(target: .ActivityDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.ActivityDomain), dependencies: [
            .domain(target: .ActivityDomain, type: .interface)
        ]),
        .tests(module: .domain(.ActivityDomain), dependencies: [
            .domain(target: .ActivityDomain),
            .domain(target: .ActivityDomain, type: .testing)
        ])
    ]
)
