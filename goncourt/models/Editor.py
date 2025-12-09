# -*- coding: utf-8 -*-

"""
Classe Editeur représentant un éditeur
"""

from dataclasses import dataclass, field
from typing import Optional


@dataclass
class Editor:
    """Editeur représentant un éditeur de livres."""
    id: Optional[int] = field(default=None, init=False)
    name: str

    def __str__(self) -> str:
        return f"{self.name}"
