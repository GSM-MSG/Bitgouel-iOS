import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.CertificationDomain.rawValue,
    targets: [
        .interface(module: .domain(.CertificationDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.CertificationDomain), dependencies: [
            .domain(target: .CertificationDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.CertificationDomain), dependencies: [
            .domain(target: .CertificationDomain, type: .interface)
        ]),
        .tests(module: .domain(.CertificationDomain), dependencies: [
            .domain(target: .CertificationDomain),
            .domain(target: .CertificationDomain, type: .testing)
        ])
    ]
)
