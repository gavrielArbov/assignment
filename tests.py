import pytest
from app import get_currency


@pytest.mark.great
def test1():
    all_currency = get_currency()
    for key, value in all_currency.items():
        assert value < 10


def test2():
    pass
