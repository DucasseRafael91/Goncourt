# -*- coding: utf-8 -*-

"""
Classe Livre représentant un livre dans le contexte du prix Goncourt
"""

from dataclasses import dataclass, field
from datetime import date
from typing import Optional
from models import Editor


@dataclass
class Book:
    """Livre représentant un livre dans le contexte du prix Goncourt."""
    id: Optional[int] = field(default=None, init=False)
    title: str
    resume: str
    publication_date: date
    pages: int
    editor_price: float
    editor: int
    author: int

    def set_editor(self, editor: Editor) -> None:
        """Indique quel est l'éditeur de ce livre."""
        if editor != self.editor:
            # il y a quelque chose à faire
            if self.editor is not None:
                # un autre enseignant enseignait précédemment ce cours, qui ne doit
                # donc plus faire partie de la liste des cours qu'il enseigne
                editor.
            # ajout du cours à l'enseignant indiqué
            teacher.courses_teached.append(self)
            # spécification de l'enseignant de ce cours
            self.teacher = teacher

    def __str__(self) -> str:
        return f"{self.name}"
