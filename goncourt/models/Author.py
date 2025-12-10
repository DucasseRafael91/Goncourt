# -*- coding: utf-8 -*-

"""
Classe Auteur représentant un auteur d'un livre
"""

from dataclasses import dataclass, field
from typing import Optional

@dataclass
class Author:
    """Auteur représentant un auteur de livres."""
    id: Optional[int] = field(default=None, init=False)
    last_name: str
    first_name: str
    biography: Optional[str] = field(default=None, init=False)

    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"
