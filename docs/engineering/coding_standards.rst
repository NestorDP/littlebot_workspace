Coding Standards
================

Code should be easy to read, test, and maintain across the Littlebot
subsystems. Follow the conventions already established in the affected
package before introducing new patterns.

General guidelines
------------------

* Use descriptive names and keep functions focused on one responsibility.
* Prefer simple, explicit control flow over clever or duplicated logic.
* Document public interfaces and non-obvious design decisions.
* Handle errors explicitly and provide useful diagnostics.
* Keep changes focused and avoid unrelated formatting changes.

Language-specific formatting and linting rules are defined by each package
and should be applied before integration.