import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.ActivityListFeature.rawValue,
    targets: [
        .interface(module: .feature(.ActivityListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.ActivityListFeature), dependencies: [
            .feature(target: .ActivityListFeature, type: .interface),
            .feature(target: .ActivityDetailFeature, type: .interface),
            .feature(target: .InputActivityFeature, type: .interface),
            .feature(target: .BaseFeature),
            .domain(target: .AuthDomain, type: .interface),
            .domain(target: .ActivityDomain, type: .interface)
        ]),
        .tests(module: .feature(.ActivityListFeature), dependencies: [
            .feature(target: .ActivityListFeature)
        ])
    ]
)
