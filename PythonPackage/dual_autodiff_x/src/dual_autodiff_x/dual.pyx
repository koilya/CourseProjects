import numpy as np
import math

class Dual:
    """
    A class that implements Dual numbers and operations on them 
    to provide auto-differentiation functionality.

    Attributes:
    - real: The real part of the dual number.
    - dual: The dual part of the dual number.
    """
    def __init__(self, real, dual):
        """
        Initializes a Dual number.

        Parameters:
        - real: real part of the number.
        - dual: dual part of the number.

        Returns:
        A Dual instance with given real and dual parts.

        Example:
        
        >>> Dual(2, 1)
        Dual(2, 1)
        """
        if isinstance(real, (int, float)):
            self.real = real
        else:
            # try to convert to help avoid error if possible
            if isinstance(real, str):
                try:
                    # Try to convert the string to a number, if possible, do so
                    real = float(real)
                    self.real = real
                    # warn the user about the issue
                    print("WARNING: You should use an int or float as input for Dual number")
                except ValueError:
                    # If it's not a number, raise one more error (TypeError as want to see a number ideally)
                    raise TypeError("Unsupported value for Dual number, looking for a number - got '{}'".format(type(real).__name__))
            else:
                raise TypeError("Unsupported type for Dual number, looking for a number - got '{}'".format(type(real).__name__))
        
        if isinstance(dual, (int, float)):
            self.dual = dual
        else:
            # try to convert to help avoid error if possible
            if isinstance(dual, str):
                try:
                    # Try to convert the string to a number, if possible, do so
                    dual = float(dual)
                    self.dual = dual
                    # warn the user about the issue
                    print("WARNING: You should use an int or float as input for Dual number")
                except ValueError:
                    # If it's not a number, raise one more error (TypeError as want to see a number ideally)
                    raise TypeError("Unsupported value for Dual number, looking for a number - got '{}'".format(type(dual).__name__))
            else:
                raise TypeError("Unsupported type for Dual number, looking for a number - got '{}'".format(type(dual).__name__))

    def __repr__(self):
        """
        Returns a string representation of the Dual number.
        """
        return f"Dual({self.real}, {self.dual})"

    def __add__(self, other):
        """
        Adds two Dual numbers together. Overrides the default + operator (for instances of Dual class).

        Parameters:
        - self: Dual number
        - other: Another Dual number to add.

        Returns:
        A Dual instance with the sum of the real and dual parts of the input Dual numbers.
        Raises TypeError if the other is not a Dual.

        Example:
        
        >>> x = Dual(2, 1)
        >>> y = Dual(3, 2)
        >>> x + y
        Dual(5, 3)
        """
        if isinstance(other, Dual):
            return Dual(self.real + other.real, self.dual + other.dual)
        else:
            raise TypeError("Unsupported operand type(s) for +: 'Dual' and '{}'".format(type(other).__name__))

    def __sub__(self, other):
        """
        Subtracts one Dual number from another. Overrides the default - operator (for instances of Dual class).

        Parameters: 
        - self: Dual number from which to subtract
        - other: Dual number to subtract.

        Returns:
        A Dual instance with the difference of the real and dual parts of the input Dual numbers.
        Raises TypeError if the other is not a Dual.

        Example:
        
        >>> Dual(2, 1) - Dual(3, 2)
        Dual(-1, -1)
        """
        if isinstance(other, Dual):
            return Dual(self.real - other.real, self.dual - other.dual)
        else:
            raise TypeError("Unsupported operand type(s) for -: 'Dual' and '{}'".format(type(other).__name__))

    def __mul__(self, other):
        """
        Multiplies two Dual numbers. Overrides the default * operator (for instances of Dual class).

        Parameters:
        - self: Dual number.
        - other: Another Dual number to multiply with.

        Returns:
        A Dual instance which is the product of the input Dual numbers. Raises TypeError if the other is not a Dual.

        Example:
        
        >>> Dual(2, 1) * Dual(3, 2)
        Dual(6, 7)
        """
        if isinstance(other, Dual):
            return Dual(self.real * other.real, self.real * other.dual + self.dual * other.real)
        else:
            raise TypeError("Unsupported operand type(s) for *: 'Dual' and '{}'".format(type(other).__name__))

    def __truediv__(self, other):
        """
        Divides one Dual number by another. Overrides the default / operator (for instances of Dual class).

        Parameters:
        - self: Dual number to divide.
        - other: Dual number to divide by.

        Returns:
        A Dual instance with the quotient of the input Dual numbers if division can be performed. 
        Raises ZeroDivisionError, otherwise. Raises TypeError if the other is not a Dual.

        Example:
        
        >>> Dual(2, 1) / Dual(4, 2)
        Dual(0.5, 0.0)
        """
        if isinstance(other, Dual):
            if other.real == 0:
                raise ZeroDivisionError("Cannot divide by zero")
            return Dual(self.real / other.real, (self.dual * other.real - self.real * other.dual) / other.real ** 2)
        else:
            raise TypeError("Unsupported operand type(s) for /: 'Dual' and '{}'".format(type(other).__name__))


    def sin(self):
        """
        Calculates the sine of the Dual number.

        Returns:
        A Dual instance which is the sine of the Dual number the function is applied to.

        Example:
        
        >>> Dual(2, 1).sin()
        Dual(0.9092974268256817, -0.4161468365471424)
        """
        return Dual(math.sin(self.real), self.dual * math.cos(self.real))

    def cos(self):
        """
        Calculates the cosine of the Dual number.

        Returns:
        A Dual instance which is the cosine of the Dual number the function is applied to.

        Example:
        
        >>> Dual(2, 1).cos()
        Dual(-0.4161468365471424, -0.9092974268256817)
        """
        return Dual(math.cos(self.real), -self.dual * math.sin(self.real))

    def tan(self):
        """
        Calculates the tangent of the Dual number.

        Returns:
        A Dual instance which is the tangent of the Dual number the function is applied to or raises
        a ValueError if the cosine of this Dual number is zero.

        Example:
        
        >>> Dual(2, 1).tan()
        Dual(-2.185039863261519, 5.774399204041917)
        """
        if (self.real % (math.pi/2)) == 0:
            raise ZeroDivisionError("Cannot compute tangent of a number with cosine of zero")
        return Dual(math.tan(self.real), self.dual / (self.cos().real)**2)


    def log(self):
        """
        Calculates the natural logarithm of the Dual number.

        Returns:
        A Dual instance which is the natural logarithm of the Dual number the function is applied to
        if the real part of the Dual number is positive, otherwise raises a ValueError.

        Example:
        
        >>> Dual(2, 1).log()
        Dual(0.6931471805599453, 0.5)
        """
        if self.real <= 0:
            raise ValueError("Cannot compute natural logarithm of zero or negative number")
        return Dual(math.log(self.real), self.dual / self.real)

    def exp(self):
        """
        Calculates the exponential of a Dual number.

        Returns:
        A Dual instance which is the exponential of the Dual number the function is applied to.

        Example:
        
        >>> Dual(2, 1).exp()
        Dual(7.38905609893065, 7.38905609893065)
        """
        return Dual(math.exp(self.real), self.dual * math.exp(self.real))
    
    def __pow__(self, other):
        """
        Calculates the power of a Dual number. Overrides the default ** operator (for instances of Dual class).

        Parameters:
        - self: Dual number to raise into the power.
        - other: Dual number or a number to raise to.

        Returns:
        A Dual instance which is the power of the Dual number the function is applied to.
        Raises a TypeError if the second operand is not a Dual number or a number or a ValueError 
        if the real part of the Dual number the function is applied to is not positive.

        Example:
        
        >>> Dual(2, 1) ** Dual(3, 2)
        Dual(8.0, 21.0)

        Another example:

        >>> Dual(2, 1) ** 2
        Dual(4, 4)
        """
        if isinstance(other, Dual):
            if self.real <= 0:
                raise ValueError("Cannot raise the Dual number to dual power if its real part is not positive")
            return Dual(self.real ** other.real, (self.real ** other.real) * (other.dual * math.log(self.real) + (self.dual * other.real) / self.real))
        elif isinstance(other, (int, float)):
            return Dual(self.real ** other, other * (self.real ** (other - 1)) * self.dual)
        else:
            raise TypeError("Unsupported operand type for **: 'Dual' and '{}'".format(type(other).__name__))
        