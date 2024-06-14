import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.UserInterface.DesignSystem.rawValue,
    targets: [
        .implements(
            module: .userInterface(.DesignSystem),
            product: .framework,
            spec: .init(
                resources: ["Resources/**"],
                dependencies: [
                    .shared(target: .GlobalThirdPartyLibrary),
                    .shared(target: .DateUtil)
                ]
            )
        ),
        .example(module: .userInterface(.DesignSystem), dependencies: [
            .userInterface(target: .DesignSystem)
        ])
    ]
)
