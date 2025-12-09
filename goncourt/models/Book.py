# -*- coding: utf-8 -*-

from dataclasses import dataclass, field
from datetime import date
from typing import Optional
from models import Editor
from models import Author
from models import Character


@dataclass
class Book:
    """Livre représentant un livre dans le contexte du prix Goncourt."""
    isbn: Optional[str] = field(default=None, init=False)
    title: str
    resume: str
    publication_date: date
    pages: int
    editor_price: float
    editor: Optional[Editor] = field(default=None, init=False)
    author: Optional[Author] = field(default=None, init=False)

    def __str__(self) -> str:
        return (f"'{self.title}' écrit par {self.author.first_name} {self.author.last_name}, édité par {self.editor}, "
                f"publié le {self.publication_date}, {self.pages} pages, "
                f"prix éditeur : {self.editor_price}€")

