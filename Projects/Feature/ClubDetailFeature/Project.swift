import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.ClubDetailFeature.rawValue,
    targets: [
        .interface(module: .feature(.ClubDetailFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.ClubDetailFeature), dependencies: [
            .feature(target: .ClubDetailFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.ClubDetailFeature), dependencies: [
            .feature(target: .ClubDetailFeature)
        ])
    ]
)
