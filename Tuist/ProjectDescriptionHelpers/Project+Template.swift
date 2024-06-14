import ConfigurationPlugin
import EnvironmentPlugin
import Foundation
import ProjectDescription

let isCI = (ProcessInfo.processInfo.environment["TUIST_CI"] ?? "0") == "1" ? true : false

public enum TMATarget {
    case interface
    case testing
    case tests
    case example
}

public extension Project {
    static func makeModule(
        name: String,
        platform: Platform = env.platform,
        product: Product,
        targets: Set<TMATarget>,
        packages: [Package] = [],
        externalDependencies: [TargetDependency] = [],
        internalDependencies: [TargetDependency] = [],
        interfaceDependencies: [TargetDependency] = [],
        testingDependencies: [TargetDependency] = [],
        testsDependencies: [TargetDependency] = [],
        exampleDependencies: [TargetDependency] = [],
        sources: SourceFilesList = .sources,
        resources: ResourceFileElements? = nil,
        settings: SettingsDictionary = [:],
        additionalPlistRows: [String: ProjectDescription.InfoPlist.Value] = [:],
        additionalFiles: [FileElement] = [],
        configurations: [Configuration] = [],
        resourceSynthesizers: [ResourceSynthesizer] = .default
    ) -> Project {
        let scripts: [TargetScript] = generateEnvironment.scripts
        let ldFlagsSettings: SettingsDictionary = product == .framework ?
            ["OTHER_LDFLAGS": .string("$(inherited) -all_load")] :
            ["OTHER_LDFLAGS": .string("$(inherited")]

        var configurations = configurations
        if configurations.isEmpty {
            configurations = .default
        }

        let settings: Settings = .settings(
            base: env.baseSetting
                .merging(settings)
                .merging(ldFlagsSettings),
            configurations: configurations,
            defaultSettings: .recommended
        )
        var allTargets: [Target] = []
        var dependencies = internalDependencies + externalDependencies

        // MARK: - Interface
        if targets.contains(.interface) {
            dependencies.append(.target(name: "\(name)Interface"))
            allTargets.append(
                Target(
                    name: "\(name)Interface",
                    platform: platform,
                    product: .framework,
                    bundleId: "\(env.organizationName).\(name)Interface",
                    deploymentTarget: env.deploymentTarget,
                    infoPlist: .default,
                    sources: .interface,
                    scripts: scripts,
                    dependencies: interfaceDependencies,
                    additionalFiles: additionalFiles
                )
            )
        }

        // MARK: - Sources
        allTargets.append(
            Target(
                name: name,
                platform: platform,
                product: product,
                bundleId: "\(env.organizationName).\(name)",
                deploymentTarget: env.deploymentTarget,
                infoPlist: .extendingDefault(with: additionalPlistRows),
                sources: sources,
                resources: resources,
                scripts: scripts,
                dependencies: dependencies
            )
        )

        // MARK: - Testing
        if targets.contains(.testing) && targets.contains(.interface) {
            allTargets.append(
                Target(
                    name: "\(name)Testing",
                    platform: platform,
                    product: .framework,
                    bundleId: "\(env.organizationName).\(name)Testing",
                    deploymentTarget: env.deploymentTarget,
                    infoPlist: .default,
                    sources: .testing,
                    scripts: scripts,
                    dependencies: [
                        .target(name: "\(name)Interface")
                    ] + testingDependencies
                )
            )
        }

        var testTargetDependencies = [
            targets.contains(.example) ?
                TargetDependency.target(name: "\(name)Example") :
                TargetDependency.target(name: name)
        ]
        if targets.contains(.testing) {
            testTargetDependencies.append(.target(name: "\(name)Testing"))
        }

        // MARK: - Tests
        if targets.contains(.tests) {
            allTargets.append(
                Target(
                    name: "\(name)Tests",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(env.organizationName).\(name)Tests",
                    deploymentTarget: env.deploymentTarget,
                    infoPlist: .default,
                    sources: .tests,
                    scripts: scripts,
                    dependencies: testTargetDependencies + testsDependencies
                )
            )
        }

        if targets.contains(.example) {
            var exampleDependencies = exampleDependencies
            exampleDependencies.append(.target(name: name))
            if targets.contains(.testing) {
                exampleDependencies.append(.target(name: "\(name)Testing"))
            }
            allTargets.append(
                Target(
                    name: "\(name)Example",
                    platform: platform,
                    product: .app,
                    bundleId: "\(env.organizationName).\(name)Example",
                    infoPlist: .extendingDefault(with: [
                        "UIMainStoryboardFile": "",
                        "UILaunchStoryboardName": "LaunchScreen",
                        "ENABLE_TESTS": .boolean(true),
                    ]),
                    sources: .exampleSources,
                    resources: ["Example/Resources/**"],
                    scripts: scripts,
                    dependencies: exampleDependencies
                )
            )
        }

        let schemes: [Scheme] = targets.contains(.example) ?
            [.makeScheme(target: .dev, name: name), .makeExampleScheme(target: .dev, name: name)] :
            [.makeScheme(target: .dev, name: name)]

        return Project(
            name: name,
            organizationName: env.organizationName,
            packages: packages,
            settings: settings,
            targets: allTargets,
            schemes: schemes,
            resourceSynthesizers: resourceSynthesizers
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }

    static func makeExampleScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)Example"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)Example"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
