from dual_autodiff.dual import Dual
import math
import pytest

def test_dual_init():
    dual_number = Dual(2,1)
    assert dual_number.real == 2
    assert dual_number.dual == 1

def test_dual_init2():
    dual_number = Dual('1',1)
    assert dual_number.real == 1
    assert dual_number.dual == 1

def test_dual_init3():
    dual_number = Dual(1,'1')
    assert dual_number.real == 1
    assert dual_number.dual == 1


def test_dual_init_err():
    with pytest.raises(TypeError):
        Dual('a',1)

def test_dual_init_err2():
    with pytest.raises(TypeError):
        Dual(3,'a1')

def test_dual_add():
    a = Dual(2,1)
    b = Dual(3,2)
    result = a + b
    assert result.real == 5
    assert result.dual == 3

def test_dual_add_err():
    a = Dual(2,1)
    b = 3
    with pytest.raises(TypeError):
        result = a + b

def test_dual_sub():
    a = Dual(2,1)
    b = Dual(3,2)
    result = a - b
    assert result.real == -1
    assert result.dual == -1

def test_dual_sub_err():
    a = Dual(2,1)
    b = 3
    with pytest.raises(TypeError):
        result = a - b

def test_dual_mul():
    a = Dual(2,1)
    b = Dual(3,2)
    result = a * b
    assert result.real == 6
    assert result.dual == 7

def test_dual_mul_err():
    a = Dual(2,1)
    b = 3
    with pytest.raises(TypeError):
        result = a * b


def test_dual_truediv():
    a = Dual(2,1)
    b = Dual(4,2)
    result = a / b
    assert result.real == 0.5
    assert result.dual == 0

def test_dual_div_by0():
    a = Dual(2,1)
    b = Dual(0,2)
    with pytest.raises(ZeroDivisionError):
        a / b

def test_dual_div_err():
    a = Dual(2,1)
    b = 3
    with pytest.raises(TypeError):
        result = a / b

def test_dual_sin():
    x = Dual(2, 1)
    result = x.sin()
    assert result.real == math.sin(2)
    assert result.dual == math.cos(2)

def test_dual_cos():
    x = Dual(2, 1)
    result = x.cos()
    assert result.real == math.cos(2)
    assert result.dual == -math.sin(2)

def test_dual_tan():
    x = Dual(4, 1)
    result = x.tan()
    assert result.real == math.tan(4)
    assert result.dual == (1 / math.cos(4))**2

def test_dual_tan_div0():
    x = Dual(0.5 * math.pi, 1)
    with pytest.raises(ZeroDivisionError):
        x.tan()

def test_dual_log():
    x = Dual(2, 1)
    result = x.log()
    assert result.real == math.log(2)
    assert result.dual == 1 / 2

def test_dual_log_exception():
    x = Dual(0, 1)
    with pytest.raises(ValueError):
        x.log()

def test_dual_exp():
    x = Dual(2, 1)
    result = x.exp()
    assert result.real == math.exp(2)
    assert result.dual == math.exp(2)

def test_dual_powR():
    x = Dual(2, 1)
    result = x ** 2
    assert result.real == 4
    assert result.dual == 4

def test_dual_powR2():
    x = Dual(0, 1)
    result = x ** 2
    assert result.real == 0
    assert result.dual == 0

def test_dual_powD():
    x = Dual(3, 4)
    y = Dual(1, 2)
    result = x ** y
    assert result.real == 3
    assert result.dual == 3 * (2*math.log(3)+(4*1)/3)

def test_dual_pow_err1():
    x = Dual(0, 1)
    y = Dual(1, 2)
    with pytest.raises(ValueError):
        x ** y

def test_dual_pow_err2():
    x = Dual(2, 1)
    y = 'a'
    with pytest.raises(TypeError):
        x ** y