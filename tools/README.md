# Workspace tools

This directory is reserved for scripts and utilities that support the multi-repository Littlebot development workspace.

Planned tools include:

- workspace prerequisite checks;
- repository import/update helpers;
- dependency setup and local dependency builds;
- colcon build and test wrappers;
- workspace cleanup and validation.

Scripts should resolve paths relative to their own location, fail on errors, avoid modifying existing Git worktrees unexpectedly, and avoid requiring global installation when a local dependency prefix is practical.

No setup scripts are added in this initial structure until the dependency and build workflows have been validated.
