from __future__ import annotations

import logging

from . import skip_some_warnings  # noqa
from .example_file import example_function

logging.basicConfig(format='%(asctime)s %(message)s', level=logging.INFO)

__all__ = [
    'example_function',
]
