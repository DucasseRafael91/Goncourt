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
    id: Optional[int] = field(default=None, init=False)
    title: str
    resume: str
    publication_date: date
    pages: int
    editor_price: float
    editor: Editor
    author: Author
    characters_in_story: list[Character] = field(default_factory=list, init=False)

    def set_editor(self, editor: Editor) -> None:
        """Associe un éditeur à ce livre."""
        if self.editor is not None and self in self.editor.books_edited:
            self.editor.books_edited.remove(self)
        self.editor = editor
        if self not in editor.books_edited:
            editor.books_edited.append(self)

    def set_author(self, author: Author) -> None:
        """Associe un éditeur à ce livre."""
        if self.author is not None and self in self.author.books_written:
            self.author.books_written.remove(self)
        self.author = author
        if self not in author.books_written:
            author.books_written.append(self)

    def add_character(self, character: Character) -> None:
        """Ajoute un livre à la liste des livres édités."""
        if character not in self.characters_in_story:
            self.characters_in_story.append(character)
        character.book = self

    def __str__(self) -> str:
        return self.title
