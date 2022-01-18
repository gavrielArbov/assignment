from requests import get
from json import loads

API_KEY = "95e6ac7890f30cacd8e5cbb05d922cb6"

def get_currency():
    response = get(f"http://api.exchangeratesapi.io/v1/latest?access_key={API_KEY}").text
    data = loads(response)
    rates = data["rates"]
    updated_rates = dict()
    for key, value in rates.items():
        if value < 10:
            updated_rates[key] = value

    return updated_rates


print(get_currency())