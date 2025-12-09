# -*- coding: utf-8 -*-

from __future__ import annotations
from dataclasses import dataclass, field
from typing import Optional
from models import Book


@dataclass
class Character:
    """Éditeur représentant un éditeur de livres."""
    id: Optional[int] = field(default=None, init=False)
    name: str
    book: Book

    def set_book(self, book: Book) -> None:
        """Associe un éditeur à ce livre."""
        if self.book is not None and self in self.book.characters_in_story:
            self.book.characters_in_story.remove(self)
        self.book = book
        if self not in book.characters_in_story:
            book.characters_in_story.append(self)

    def __str__(self) -> str:
        return self.name + f" (dans '{self.book.title}')"
