import ConfigurationPlugin
import DependencyPlugin
import EnvironmentPlugin
import ProjectDescription

// MARK: Interface
public extension Target {
    static func interface(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .interface
        }
        .toTarget(with: module.targetName(type: .interface), product: .framework)
    }

    static func interface(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .interface, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .interface), product: .framework)
    }

    static func interface(name: String, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .interface
        }
        .toTarget(with: "\(name)Interface", product: .framework)
    }

    static func interface(name: String, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .interface, dependencies: dependencies)
            .toTarget(with: "\(name)Interface", product: .framework)
    }
}

// MARK: Implements
public extension Target {
    static func implements(
        module: ModulePaths,
        product: Product = .staticLibrary,
        spec: TargetSpec
    ) -> Target {
        spec.with {
            $0.sources = .sources
        }
        .toTarget(with: module.targetName(type: .sources), product: product)
    }

    static func implements(
        module: ModulePaths,
        product: Product = .staticLibrary,
        dependencies: [TargetDependency] = []
    ) -> Target {
        TargetSpec(sources: .sources, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .sources), product: product)
    }

    static func implements(
        name: String,
        product: Product = .staticLibrary,
        spec: TargetSpec
    ) -> Target {
        spec.with {
            $0.sources = .sources
        }
        .toTarget(with: name, product: product)
    }

    static func implements(
        name: String,
        product: Product = .staticLibrary,
        dependencies: [TargetDependency] = []
    ) -> Target {
        TargetSpec(sources: .sources, dependencies: dependencies)
            .toTarget(with: name, product: product)
    }
}

// MARK: Testing
public extension Target {
    static func testing(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .testing
        }
        .toTarget(with: module.targetName(type: .testing), product: .framework)
    }

    static func testing(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .testing, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .testing), product: .framework)
    }

    static func testing(name: String, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .testing
        }
        .toTarget(with: "\(name)Testing", product: .framework)
    }

    static func testing(name: String, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .testing, dependencies: dependencies)
            .toTarget(with: "\(name)Testing", product: .framework)
    }
}

// MARK: Tests
public extension Target {
    static func tests(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .tests
        }
        .toTarget(with: module.targetName(type: .tests), product: .unitTests)
    }

    static func tests(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .tests, dependencies: dependencies)
            .toTarget(with: module.targetName(type: .tests), product: .unitTests)
    }

    static func tests(name: String, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .tests
        }
        .toTarget(with: "\(name)Tests", product: .unitTests)
    }

    static func tests(name: String, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(sources: .tests, dependencies: dependencies)
            .toTarget(with: "\(name)Tests", product: .unitTests)
    }
}

// MARK: Example
public extension Target {
    static func example(module: ModulePaths, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .exampleSources
            $0.settings = .settings(
                base: (spec.settings?.base ?? [:])
                    .merging(["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable"]),
                configurations: .default,
                defaultSettings: spec.settings?.defaultSettings ?? .recommended
            )
            $0.dependencies = spec.dependencies + [.SPM.Needle]
            $0.infoPlist = spec.infoPlist ?? .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true)
            ])
        }
        .toTarget(with: module.targetName(type: .example), product: .app)
    }

    static func example(module: ModulePaths, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true)
            ]),
            sources: .exampleSources,
            dependencies: dependencies + [.SPM.Needle],
            settings: .settings(
                base: ["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable"],
                configurations: .default
            )
        )
        .toTarget(with: module.targetName(type: .example), product: .app)
    }

    static func example(name: String, spec: TargetSpec) -> Target {
        spec.with {
            $0.sources = .exampleSources
            $0.settings = .settings(
                base: (spec.settings?.base ?? [:])
                    .merging(["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable"]),
                configurations: .default,
                defaultSettings: spec.settings?.defaultSettings ?? .recommended
            )
            $0.dependencies = spec.dependencies + [.SPM.Needle]
            $0.infoPlist = spec.infoPlist ?? .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true)
            ])
        }
        .toTarget(with: "\(name)Example", product: .app)
    }

    static func example(name: String, dependencies: [TargetDependency] = []) -> Target {
        TargetSpec(
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true)
            ]),
            sources: .exampleSources,
            dependencies: dependencies + [.SPM.Needle],
            settings: .settings(
                base: ["OTHER_LDFLAGS": "$(inherited) -Xlinker -interposable"],
                configurations: .default
            )
        )
        .toTarget(with: "\(name)Example", product: .app)
    }
}
