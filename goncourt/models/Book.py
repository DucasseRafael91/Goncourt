# -*- coding: utf-8 -*-

from dataclasses import dataclass, field
from datetime import date
from typing import Optional
from models import Editor
from models import Author


@dataclass
class Book:
    """Livre représentant un livre dans le contexte du prix Goncourt."""
    isbn: Optional[str] = field(default=None, init=False)
    title: str
    resume: str
    publication_date: date
    pages: int
    editor_price: float
    nbr_votes: Optional[int] = field(default=None, init=False)
    editor: Optional[Editor] = field(default=None, init=False)
    author: Optional[Author] = field(default=None, init=False)

    def __str__(self) -> str:
        if self.nbr_votes:
            return (f"'{self.title}' écrit par {self.author.first_name} {self.author.last_name}"
                    f", édité par {self.editor}, "
                    f"publié le {self.publication_date}, "
                    f"{self.pages} pages, "
                    f"prix éditeur : {self.editor_price}€, "
                    f"nombre de votes : {self.nbr_votes}")
        else:
            return (f"'{self.title}' écrit par {self.author.first_name} {self.author.last_name}, "
                    f"édité par {self.editor}, "
                    f"publié le {self.publication_date}, "
                    f"{self.pages} pages, "
                    f"prix éditeur : {self.editor_price}€")

