# -*- coding: utf-8 -*-

from dataclasses import dataclass, field
from typing import Optional
from models import Book

@dataclass
class SelectionLivre:
    """Livre représentant un livre dans le contexte du prix Goncourt."""
    book: Book
    selection: Optional[int] = field(default=None, init=False)
    nbr_votes: Optional[int] = field(default=None, init=False)


