# from django.db.models import Q
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError


def phone_validators(value):
    validator_fn = [
        RegexValidator(r'^\(?([0-9]{2})\)? ([0-9]{1})? ([0-9]{4})[-. ]?([0-9]{4})$',
                       "Digite apenas números. (XX) X XXXX-XXXX ou (XX) XXXX-XXXX"),
        RegexValidator(r'^\(?([0-9]{2})\)? ([0-9]{4})[-. ]?([0-9]{4})$',
                       "Digite apenas números. (XX) X XXXX-XXXX ou (XX) XXXX-XXXX")
    ]
    err = None
    for validator in validator_fn:
        try:
            validator(value)
            # Valid value, return it
            return value
        except ValidationError as exc:
            err = exc
    # Value match nothing, raise error
    raise err
