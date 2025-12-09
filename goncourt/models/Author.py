# -*- coding: utf-8 -*-

"""
Classe Auteur représentant un auteur d'un livre
"""

from dataclasses import dataclass, field
from typing import Optional
from models import Book


@dataclass
class Author:
    """Auteur représentant un auteur de livres."""
    id: Optional[int] = field(default=None, init=False)
    last_name: str
    first_name: str
    biographie: Optional[str] = field(default=None, init=False)
    books_written: list[Book] = field(default_factory=list, init=False)

    def add_book(self, book: Book) -> None:
        """Ajoute un livre à la liste des livres édités."""
        if book not in self.books_written:
            self.books_written.append(book)
        book.editor = self

    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"
