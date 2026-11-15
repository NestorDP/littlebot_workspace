Testing Strategy
================

Testing verifies both individual components and the behavior of the complete
robot system. Tests should be repeatable and should run as close as possible
to the code they validate.

Test levels
-----------

* **Unit tests** validate individual functions, classes, and nodes.
* **Integration tests** validate communication and behavior across packages.
* **System tests** validate end-to-end robot workflows.
* **Hardware tests** validate behavior on the target hardware where
  simulation cannot provide sufficient confidence.

New functionality should include focused tests for its normal and important
failure paths. Run the smallest relevant test set during development and the
broader workspace tests before integration.