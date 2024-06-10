import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    targets: [
        .implements(
            module: .feature(.BaseFeature),
            product: .framework,
            dependencies: [
                .userInterface(target: .DesignSystem),
                .shared(target: .GlobalThirdPartyLibrary),
                .shared(target: .UtilityModule),
                .shared(target: .DateUtil)
            ]
        ),
        .tests(module: .feature(.BaseFeature), dependencies: [
            .feature(target: .BaseFeature)
        ])
    ]
)
