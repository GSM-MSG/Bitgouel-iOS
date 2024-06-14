import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.ClubDomain.rawValue,
    targets: [
        .interface(module: .domain(.ClubDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.ClubDomain), dependencies: [
            .domain(target: .ClubDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.ClubDomain), dependencies: [
            .domain(target: .ClubDomain, type: .interface)
        ]),
        .tests(module: .domain(.ClubDomain), dependencies: [
            .domain(target: .ClubDomain),
            .domain(target: .ClubDomain, type: .testing)
        ])
    ]
)
