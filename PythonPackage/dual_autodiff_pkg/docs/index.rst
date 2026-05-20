.. Dual Auto-Differentiation documentation master file, created by
   sphinx-quickstart on Sun Dec  1 00:07:32 2024.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Dual Auto-Differentiation Package Documentation
================================================

.. toctree::
   :maxdepth: 2
   :caption: Contents:
   :hidden:

   tutorial_notebook
   comparison

| *Author*: Ilya Kogan

.. _DualAutodiff_Package:

The **dual_autodiff package** is a Python package designed to incorporate instant differentiation using Dual numbers.

Installation
------------

To install the package and its dependencies (in editable mode) from the dual_autodiff_pkg directory with:

.. code-block:: bash

   pip install -e .

Or install the package from the wheel (binary distribution of the code) from the dual_autodiff_pkg/dist directory using:

.. code-block:: bash

   pip install dual_autodiff-0.1.0-py3-none-any.whl

Usage
-----

Here's a quick example of how to use the package:

.. code-block:: python

   from dual_autodiff import Dual

   x = Dual(2, 1)  # Dual number representing (2 + 1ε)
   print("Real part:", x.real)
   print("Dual part:", x.dual)

   # performing operations on dual numbers
   Dual(3,4) + Dual(2,1) ** 2 - Dual(1,1).sin()

   # calculating a derivative of a function g(x)=x^2-xcosx at x=2
   def g(x):
      return x**2 - x*(x.cos())

   print(f"Derivative of g(x) at x=2 is {g(Dual(2,1)).dual}")

API Reference
-------------------------------------------------------------------------------

.. automodule:: dual_autodiff.dual
   :members:
   :special-members: __init__, __repr__, __add__, __sub__, __mul__, __truediv__, __pow__
   :undoc-members:

Contributing
------------

Contributions are welcome! Fork our repository and submit a pull request.

License
-------

This project is licensed under the MIT License.

.. note::
   This package was developed for the Coursework of the following course: 
   `MPhil in Data Intensive Science <https://mphildis.bigdata.cam.ac.uk>`_ 

Useful Resources and further reading
----------------------------------------
- `Dual Numbers <https://en.wikipedia.org/wiki/Dual_number>`_
- `Automatic Differentiation <https://en.wikipedia.org/wiki/Automatic_differentiation>`_
