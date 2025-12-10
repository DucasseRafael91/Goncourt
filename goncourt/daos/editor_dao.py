# -*- coding: utf-8 -*-

"""
Classe Dao[Address]
"""

from models.Editor import Editor
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional, List


@dataclass
class EditorDao(Dao[Editor]):
    def create(self, editor: Editor) -> int:
        pass

    def read(self, id_editor: int) -> Optional[Editor]:
        """Renvoi le cours correspondant à l'entité dont l'id est id_course
           (ou None s'il n'a pu être trouvé)"""
        editor: Optional[Editor]

        with Dao.connection.cursor() as cursor:
            sql = "SELECT * FROM g_editeur WHERE e_id=%s"
            cursor.execute(sql, (id_editor,))
            record = cursor.fetchone()
        if record is not None:
            editor = Editor(record['nom'])
            editor.id = id_editor
        else:
            editor = None

        return editor

    def read_all(self) -> List[Editor]:
        pass

    def update(self, address: Editor) -> bool:
        pass

    def delete(self, id_editor: int) -> bool:
        pass
