import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Domain.LectureDomain.rawValue,
    targets: [
        .interface(module: .domain(.LectureDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .implements(module: .domain(.LectureDomain), dependencies: [
            .domain(target: .LectureDomain, type: .interface),
            .domain(target: .BaseDomain)
        ]),
        .testing(module: .domain(.LectureDomain), dependencies: [
            .domain(target: .LectureDomain, type: .interface)
        ]),
        .tests(module: .domain(.LectureDomain), dependencies: [
            .domain(target: .LectureDomain),
            .domain(target: .LectureDomain, type: .testing)
        ])
    ]
)
