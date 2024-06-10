import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.ClubListFeature.rawValue,
    targets: [
        .interface(module: .feature(.ClubListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.ClubListFeature), dependencies: [
            .feature(target: .ClubListFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.ClubListFeature), dependencies: [
            .feature(target: .ClubListFeature)
        ])
    ]
)
