# -*- coding: utf-8 -*-

from dataclasses import dataclass, field
from typing import Optional
from models import Book

@dataclass
class SelectionLivre:
    """Livre représentant un livre dans le contexte du prix Goncourt."""
    book: Book
    selection: Optional[int] = field(default=None, init=False)

    def __str__(self) -> str:
        return (f"'{self.title}' écrit par {self.author.first_name} {self.author.last_name}, édité par {self.editor}, "
                f"publié le {self.publication_date}, {self.pages} pages, "
                f"prix éditeur : {self.editor_price}€")

