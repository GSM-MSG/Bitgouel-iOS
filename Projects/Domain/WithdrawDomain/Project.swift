import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.WithdrawDomain.rawValue,
    targets: [
        .interface(module: .domain(.WithdrawDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.WithdrawDomain), dependencies: [
            .domain(target: .WithdrawDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.WithdrawDomain), dependencies: [
            .domain(target: .WithdrawDomain, type: .interface)
        ]),
        .tests(module: .domain(.WithdrawDomain), dependencies: [
            .domain(target: .WithdrawDomain),
            .domain(target: .WithdrawDomain, type: .testing)
        ])
    ]
)
