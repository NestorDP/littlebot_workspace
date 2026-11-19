# ADR-0002: Littlebot Documentation Architecture

**Status:** Accepted  
**Date:** 2026-11-17  
**Decision makers:** Littlebot project maintainers

## 1. Context

The Littlebot project is organized into multiple repositories, each responsible for a different subsystem of the complete robotic platform. These repositories include the ROS 2 software, embedded firmware, simulation environment, graphical user interface, hardware design, and the central engineering workspace.

As the project evolves, each repository requires documentation describing its architecture, implementation, development environment, interfaces, and usage. At the same time, the project requires a unified engineering perspective that describes the complete system, its requirements, architectural decisions, subsystem responsibilities, and integration strategy.

Maintaining all documentation in a single repository would create unnecessary coupling between subsystems and could lead to duplicated or outdated implementation information. Conversely, maintaining completely independent documentation without common guidelines would make it difficult to understand the complete system and navigate between its components.

Therefore, a consistent documentation architecture is required to establish:

- Clear ownership of documentation across repositories.
- Separation between system-level engineering and subsystem-level implementation documentation.
- A defined location for API and technical references.
- Consistent cross-linking between documentation levels.
- Rules to prevent unnecessary duplication and conflicting information.
- A strategy for integrating subsystem documentation into a unified documentation website.

## 2. Decision

The Littlebot project shall adopt a **three-level documentation architecture**, consisting of:

1. System engineering documentation.
2. Subsystem engineering documentation.
3. API and technical reference documentation.

Documentation ownership shall follow repository responsibility: the repository responsible for a system or technical component shall maintain its corresponding authoritative documentation.

The `littlebot_workspace` repository shall be the central owner of system-level engineering documentation and the integration point for the project's unified documentation website. Each subsystem repository shall remain responsible for its own implementation and API documentation.

### 2.1 System Engineering Documentation

**Owner:** `littlebot_workspace`

System engineering documentation shall describe the complete Littlebot platform, its architecture, requirements, subsystem responsibilities, and integration strategy.

It shall provide a system-wide perspective without duplicating the implementation details maintained by individual subsystem repositories.

Its scope includes:

- System overview and requirements.
- Overall system architecture.
- Subsystem responsibilities and boundaries.
- Cross-subsystem interfaces and integration contracts.
- System integration and verification strategies.
- Engineering processes and development standards.
- Architectural Decision Records (ADRs).
- System-level configuration and project management practices.

The canonical location shall be:

```text
littlebot_workspace/docs/
├── system/
├── engineering/
├── decisions/
└── subsystems/
```

The `subsystems/` directory shall contain system-level descriptions of each subsystem, including its purpose, responsibilities, dependencies, and relationships with other components. It shall not replace the implementation documentation maintained in the corresponding repository.

### 2.2 Subsystem Engineering Documentation

**Owner:** Corresponding subsystem repository.

Each subsystem repository shall maintain documentation describing its internal architecture, implementation, development, configuration, testing, and usage.

Its scope includes:

- Subsystem overview and architecture.
- Internal component organization.
- Implementation details and design decisions specific to the subsystem.
- Development environment and dependencies.
- Build, installation, and configuration procedures.
- Testing and validation procedures.
- Usage instructions and examples.
- Known limitations and troubleshooting information.

The canonical location shall normally be:

```text
<subsystem_repository>/
└── docs/
```

Each repository shall remain independently maintainable and shall provide sufficient documentation for developers to understand, build, test, and maintain its subsystem without requiring the central documentation website.

### 2.3 API and Technical Reference Documentation

**Owner:** Repository defining and maintaining the corresponding interface or technical component.

API and technical reference documentation shall describe the interfaces exposed by software components and the technical specifications required to use or integrate hardware and simulation components.

Examples include:

- Public C and C++ interfaces.
- Classes, functions, structures, and enumerations.
- ROS 2 topics, services, actions, and parameters.
- Communication protocols and message definitions.
- Simulation plugins and configuration parameters.
- Hardware connectors, pin assignments, and electrical specifications.
- Relevant component and interface specifications.

Whenever practical, API documentation shall be generated from source code, interface definitions, or other authoritative technical artifacts.

For software API documentation, tools such as Doxygen may be used, with Sphinx and Breathe providing integration into the subsystem documentation.

Generated documentation shall be reproducible and shall not become an independently maintained source of technical information.

## 3. Documentation Ownership

The following ownership model shall apply:

| Repository | Documentation responsibility |
|----|----|
| `littlebot_workspace` | System engineering, overall architecture, requirements, integration, engineering processes, and system-level interfaces. |
| `littlebot` | ROS 2 subsystem architecture, packages, nodes, configuration, usage, and ROS 2 API references. |
| `littlebot_firmware` | Firmware architecture, development, build, testing, communication protocols, and public firmware API references. |
| `littlebot_gazebo` | Simulation architecture, robot models, worlds, simulation configuration, plugins, and simulation interfaces. |
| `littlebot_rqt_plugin` | GUI architecture, development, usage, plugin interfaces, and public C++ API references. |
| `littlebot_hardware` | Electrical and hardware architecture, schematic and PCB design, design validation, connector specifications, and hardware references. |

A repository may contain multiple documentation categories, but it shall remain the authoritative owner of the technical information associated with its implementation.

System-level interface contracts that describe interactions between multiple subsystems shall be maintained in `littlebot_workspace`. The corresponding implementation details shall remain in the repositories responsible for each subsystem.

## 4. Cross-Linking Strategy

Documentation shall be interconnected to provide navigation between system, subsystem, and API levels.

The following rules shall apply:

### 4.1 System-to-Subsystem References

System documentation shall describe each subsystem's purpose, responsibilities, dependencies, and relationships with the rest of the platform.

Detailed implementation information shall be referenced through links to the corresponding subsystem documentation.

### 4.2 Subsystem-to-System References

Subsystem documentation shall reference relevant system-level requirements, architectural descriptions, interface contracts, and ADRs.

This ensures that implementation decisions and subsystem behavior remain traceable to the overall system architecture.

### 4.3 Subsystem-to-API References

Subsystem guides and architecture descriptions shall link to the corresponding API and technical reference documentation whenever developers need detailed interface information.

### 4.4 API-to-Subsystem References

API documentation shall provide links to relevant subsystem architecture and usage guides, allowing developers to understand the context in which an interface is used.

### 4.5 Link Conventions

When documentation is included in the same Sphinx build, Sphinx-native references such as `:doc:` and `:ref:` shall be preferred.

When documentation remains in independently published sites, links shall reference the corresponding published documentation pages.

Links to source code may be provided through the repository hosting platform when direct code inspection is useful.

Links shall not depend on temporary build directories, local filesystem paths, or other developer-specific environments.

## 5. Documentation Integration

The project shall progressively establish a unified documentation website using Sphinx and Read the Docs.

The central documentation build shall be maintained by `littlebot_workspace` and shall integrate the documentation produced by the subsystem repositories.

The integration strategy shall follow these principles:

- System engineering documentation shall be maintained directly in `littlebot_workspace`.
- Subsystem documentation shall be retrieved from their respective repositories.
- Subsystem documentation shall remain independently buildable.
- Integration shall preserve documentation structure, assets, and internal references.
- The source repository and revision used for each integrated documentation component shall be identifiable.
- Documentation integration shall use explicit repository revisions to ensure reproducibility.

The repository manifest or another centrally maintained configuration shall be used to identify the subsystem revisions included in the unified documentation build.

The detailed build and publication workflow shall be documented separately in the workspace engineering documentation.

## 6. Duplication and Source-of-Truth Rules

To avoid conflicting information and unnecessary maintenance, the following rules shall apply:

1. Every technical subject shall have one authoritative documentation owner.
2. System-level requirements, overall architecture, and cross-subsystem contracts shall be maintained in `littlebot_workspace`.
3. Subsystem implementation details shall be maintained in the corresponding subsystem repository.
4. API and technical references shall be maintained by the repository defining the corresponding interface or component.
5. Central subsystem descriptions may summarize responsibilities and relationships, but shall not reproduce complete implementation guides.
6. Subsystem documentation may reference system requirements and architectural decisions, but shall not independently redefine them.
7. Generated API documentation shall be derived from its authoritative source and shall not be manually maintained as a separate source of truth.
8. Common information shall be referenced through links whenever possible instead of copied between repositories.
9. When information must be summarized in multiple documentation locations, the authoritative source shall be explicitly identified.
10. Changes to system interfaces or subsystem responsibilities shall trigger a review of the affected documentation across the relevant repositories.

## 7. Consequences

### 7.1 Positive Consequences

- Clear documentation ownership across the project.
- Separation of system engineering concerns from subsystem implementation details.
- Reduced duplication and lower risk of inconsistent documentation.
- Independent development and maintenance of subsystem documentation.
- Improved traceability between system requirements, architectural decisions, implementations, and interfaces.
- A unified documentation entry point for developers and maintainers.
- Greater scalability as new repositories and subsystems are added to Littlebot.

### 7.2 Negative Consequences and Trade-offs

- Maintaining cross-repository references requires coordination between subsystem maintainers.
- The unified documentation build introduces an additional integration and maintenance responsibility.
- Changes to shared interfaces may require documentation updates in multiple repositories.
- Independent documentation builds and the central documentation build must be validated to avoid broken references and integration inconsistencies.
- Repository revisions must be managed explicitly to maintain reproducible documentation releases.

## 8. Implementation Responsibilities

The adoption of this decision requires the following actions:

1. Establish this ADR in `littlebot_workspace`.
2. Update the central documentation index to include the ADR.
3. Establish a practical documentation model describing how the decision shall be applied.
4. Review the existing documentation structure of each subsystem repository.
5. Align subsystem documentation with the ownership and cross-linking rules defined here.
6. Establish the Sphinx integration workflow for the unified documentation website.
7. Validate independent and integrated documentation builds.
8. Maintain the documentation architecture as new subsystems and interfaces are introduced.

The implementation may be carried out incrementally. Existing documentation shall be migrated or reorganized when the corresponding subsystem documentation is updated, rather than requiring all repositories to be restructured simultaneously.

## 9. References

- [Sphinx Documentation](https://www.sphinx-doc.org/)
- [Read the Docs Documentation](https://docs.readthedocs.com/)
- [Doxygen Documentation](https://www.doxygen.nl/manual/)
- [Breathe Documentation](https://breathe.readthedocs.io/)

## 10. Revision History

| Version | Date | Description |
|---|---|---|
| 1.0 | 2026-11-17 | Initial documentation architecture decision. |
