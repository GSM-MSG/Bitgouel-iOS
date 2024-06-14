import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.ActivityDetailFeature.rawValue,
    targets: [
        .interface(module: .feature(.ActivityDetailFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.ActivityDetailFeature), dependencies: [
            .feature(target: .ActivityDetailFeature, type: .interface),
            .feature(target: .BaseFeature),
            .feature(target: .InputActivityFeature, type: .interface),
            .domain(target: .ActivityDomain, type: .interface),
            .domain(target: .AuthDomain, type: .interface)
        ]),
        .tests(module: .feature(.ActivityDetailFeature), dependencies: [
            .feature(target: .ActivityDetailFeature)
        ])
    ]
)
