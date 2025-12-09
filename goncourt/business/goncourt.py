# -*- coding: utf-8 -*-

"""
Classe School
"""

from dataclasses import dataclass, field
from datetime import date
from typing import Optional

from daos.editor_dao import EditorDao
from models.Editor import Editor



@dataclass
class Goncourt:
    """Couche métier de l'application de gestion d'une école,
    reprenant les cas d'utilisation et les spécifications fonctionnelles :
    - courses : liste des cours existants
    - teachers : liste des enseignants
    - students : liste des élèves"""

    @staticmethod
    def get_editor_by_id(id_editor: int) -> Optional[Editor]:
        editor_dao: EditorDao = EditorDao()
        return editor_dao.read(id_editor)

