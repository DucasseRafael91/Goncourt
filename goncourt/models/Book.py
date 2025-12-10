# -*- coding: utf-8 -*-

from dataclasses import dataclass, field
from datetime import date
from typing import Optional, List
from models import Editor
from models import Author
from models.Character import Character


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
    characters_in_stories: Optional[List[Character]] = field(default_factory=list, init=False)

    def __str__(self) -> str:

        return (
            f"'{self.title}' écrit par {self.author.first_name} {self.author.last_name}, "
            f"édité par {self.editor}, "
            f"publié le {self.publication_date}, "
            f"{self.pages} pages, "
            f"prix éditeur : {self.editor_price}€, "
            f"Personnages : {self.characters_in_stories}, "
        )



