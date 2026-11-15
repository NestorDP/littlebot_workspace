Configuration Management
========================

Configuration management keeps source code, robot parameters, launch files,
hardware descriptions, and build settings consistent and reproducible.

Configuration changes should be reviewed together with the code that
consumes them. Use version control for project configuration and avoid
machine-specific paths or undocumented local overrides.

When changing configuration:

* Describe the purpose and expected effect of the change.
* Preserve safe defaults where practical.
* Update dependent launch files and documentation.
* Validate the configuration in simulation or on hardware as appropriate.
* Keep generated files out of source control unless they are explicitly
  required artifacts.