# -*- coding: utf-8 -*-

"""
Classe Selection représentant les 3 étapes de la sélection du prix Goncourt
"""

from dataclasses import dataclass, field
from typing import Optional


@dataclass
class Selection:
    """Selection représentant une étape de la sélection du prix Goncourt."""
    id: Optional[int] = field(default=None, init=False)
    name: str

    def __str__(self) -> str:
        return f"{self.name}"
