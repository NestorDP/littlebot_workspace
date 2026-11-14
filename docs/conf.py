# Sphinx configuration file for Littlebot Engineering Documentation.

# -- Project information -----------------------------------------------------

project = "Littlebot"
author = "Littlebot Contributors"
copyright = "2026, Littlebot Project"

# -- General configuration ---------------------------------------------------

extensions = [
    "sphinx.ext.todo",
]

root_doc = "index"

templates_path = []

exclude_patterns = [
    "_build",
    "Thumbs.db",
    ".DS_Store",
]

language = "en"

# Include TODO directives in the generated documentation.
todo_include_todos = True

# -- HTML output -------------------------------------------------------------

html_theme = "sphinx_rtd_theme"

html_title = "Littlebot Engineering Documentation"

html_static_path = []