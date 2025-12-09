# -*- coding: utf-8 -*-

"""
Classe Editeur représentant un éditeur
"""

from dataclasses import dataclass, field
from typing import Optional
from models import Book


@dataclass
class Editor:
    """Editeur représentant un éditeur de livres."""
    id: Optional[int] = field(default=None, init=False)
    name: str
    books_edited: list[Book] = field(default_factory=list, init=False)

    def add_book(self, book: Book) -> None:
        """Ajout du cours course à la liste des cours qu'il enseigne."""
        book.editor = self

    def __str__(self) -> str:
        return f"{self.name}"
