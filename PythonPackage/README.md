# Dual Auto-differentiation Package

The Dual Auto-differentiation Package is a Python package that implements forward-mode automatic differentiation using dual numbers.

## Features

Base Dual class represents Dual numbers, where mathematical operations using Dual numbers are also defined.

## Installation

To install the package, perform the following upon download:

Install the package and its dependencies (in editable mode) from the dual_autodiff_pkg directory with:
```bash
pip install -e .
```

Or install the package from the wheel (binary distribution of the code) from the dual_autodiff_pkg/dist directory using:
```bash
   pip install dual_autodiff-0.1.0-py3-none-any.whl
```

Wheels for cythonized package can be found in the dual_autodiff_x/wheelhouse directory and are installable from root of the project directory using the following command by replacing the <name of wheel> with the name of the wheel that is desired to be installed from:
```bash
pip install dual_autodiff_x/wheelhouse/<name of wheel>
```

Or from the dual_autodiff_x/wheelhouse directory, using:
```bash
pip install <name of wheel>
```

If desired, dual_autodiff_x can also be installed in editable mode using the following command from within the dual_autodiff_x outer directory:
```bash
pip install -e .
```

## Usage

This is an example of how to use the package, more examples are available in the documentation and notebooks.

```python

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
```

Note: to ensure proper environment for running jupyter notebooks or for domestic recreation of documentation, the environment containing all necessary packages can be installed from requirements.txt using:
```bash
pip install -r requirements.txt
```

## Documentation

Link to the [Documentation](docs/_build/html/index.html)

All documentation in html format can be found in dual_autodiff_pkg/docs/_build/html and accessed through index.html. All Jupyter notebooks can be found in dual_autodiff_pkg/docs directory as well as in html documentation.

To generate documentation using Sphinx run the following from dual_autodiff_pkg/docs/ (requires Sphinx which is included in requirements.ext):
```bash
make html
```

To get to dual_autodiff_pkg/docs/ from root directory use:
```bash
cd dual_autodiff_pkg/docs
```

The report can be found in report directory.

## License

This project is licensed under the MIT License

## Additional information
More files would be added to .gitignore and untracked from Git if it wasn't coursework where necessary to showcase everything done (like _build would be untracked as documentation would be available online)

## AI tools usage
ChatGPT was only used supportively, namely for:
- to find out how to override the default addition operation (by defining __add__ method), other operations were defined by myself accordingly.
- to find out how to format the output of Dual instances in a readable format instead of Dual instance location (by defining __repr__ method)
- formatting the output of type(real) returns <class 'str'>, to type(real).__name__ which gives just the name of the class (e.g., 'str').
- to find out how to derive a formula for raising dual numbers into dual powers (as when I used the formula with the derivative, the result wasn't sensible). Once finding out a hint to use exp and log functions, I performed the derivation myself.
- to determine the need of tutorial_notebook.rst file which allows for creation of additional documentation page that contains the notebook.
- uage of :hidden: option to hide the toctree from being displayed in the main page content