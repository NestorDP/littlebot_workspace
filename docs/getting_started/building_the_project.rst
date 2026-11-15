Building the Project
====================

The Littlebot workspace is built with ``colcon``.

From the workspace root, source the required ROS 2 environment and build the
packages using the workspace's documented configuration. Build output should
be checked for warnings and errors before running the relevant tests.

After a successful build, source the generated workspace environment before
running nodes, launch files, or tests that depend on the built packages.