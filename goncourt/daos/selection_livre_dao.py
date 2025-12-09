# -*- coding: utf-8 -*-

"""
Classe Dao[SelectionLivre]
"""

from models.selection_livre import SelectionLivre
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional, List


@dataclass
class SelectionLivreDao(Dao[SelectionLivre]):
    def create(self, selection: SelectionLivre) -> int:
        pass

    def read(self, id_selection: int) -> Optional[SelectionLivre]:
        """Renvoie la sélection correspondant à l'entité dont l'id est id_selection
           (ou None si elle n'a pu être trouvée)"""
        selection: Optional[SelectionLivre]

        with Dao.connection.cursor() as cursor:
            sql = "SELECT * FROM g_selection_livre WHERE s_id=%s"
            cursor.execute(sql, (id_selection,))
            record = cursor.fetchone()
        if record is not None:
            selection = SelectionLivre(record['nom'])
            selection.id = id_selection
        else:
            selection = None

        return selection

    def read_all(self) -> List[SelectionLivre]:
        pass

    def update(self, selection: SelectionLivre) -> bool:
        pass

    def delete_by_selection_id(self, id_selection: int) -> bool:
        try:
            with Dao.connection.cursor() as cursor:
                sql = "DELETE FROM g_selection_livre WHERE s_fk_selection_id=%s"
                cursor.execute(sql, (id_selection,))
                Dao.connection.commit()
                return cursor.rowcount > 0
        except Exception as e:
            print(f"Erreur lors de la suppression : {e}")
            return False

