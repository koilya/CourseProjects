nbsphinx_kernel_name = 'python3'

import sphinx_rtd_theme

# -- Project information -----------------------------------------------------
project = 'Dual Auto-differentiation Package'
copyright = '2024, Ilya Kogan'
author = 'Ilya Kogan'

# The full version, including alpha/beta/rc tags
release = 'beta'

# -- General configuration ---------------------------------------------------
import os
import sys

# Add the package directory to sys.path
sys.path.insert(0, os.path.abspath('../'))  # This points to the root directory containing 'dual_autodiff_pkg'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
	'nbsphinx',
    'myst_parser',
    'sphinx.ext.autodoc',    # Autodoc extension for extracting docstrings
	'sphinx.ext.mathjax',
	'sphinx_rtd_theme',
    'sphinx_gallery.load_style',  # load CSS for gallery (needs SG >= 0.6)
]

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'

master_doc = 'index'

highlight_language = 'python3'

nbsphinx_execute_arguments = [
    "--InlineBackend.figure_formats={'svg', 'pdf'}",
    "--InlineBackend.rc={'figure.dpi': 96}",
]


# Disable section numbering
secnumber_suffix = ''  # No suffix means no section numbers
