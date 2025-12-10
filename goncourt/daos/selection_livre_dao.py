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
        try:
            with Dao.connection.cursor() as cursor:
                sql = """
                           INSERT INTO g_selection_livre (s_fk_selection_id, s_fk_livre_isbn)
                           VALUES (%s, %s)
                       """
                cursor.execute(sql, (selection.selection, selection.book.isbn))

                selection_id = cursor.lastrowid

            # Validation de l'insertion
            Dao.connection.commit()
            return selection_id

        except Exception as e:
            print("Erreur lors de la création :", e)
            Dao.connection.rollback()
            return 0

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
        # TODO document why this method is empty
        pass

    def update(self, selection: SelectionLivre) -> bool:
        """Met à jour en BD l'entité Course correspondant à course


                        :param book: Livre déjà mis à jour en mémoire
                        :return: True si la mise à jour a pu être réalisée
                        """
        try:
            with Dao.connection.cursor() as cursor:
                sql = """UPDATE g_selection_livre SET s_nbr_votes=%s 
                         WHERE s_fk_livre_isbn=%s"""
                cursor.execute(sql, (
                    selection.nbr_votes,
                    selection.book.isbn
                ))

            Dao.connection.commit()

            return cursor.rowcount > 0

        except Exception as e:
            print("Erreur lors de la mise à jour :", e)
            Dao.connection.rollback()
            return False

    def delete(self, id_selection: int) -> bool:
        try:
            with Dao.connection.cursor() as cursor:
                sql = "DELETE FROM g_selection_livre WHERE s_fk_selection_id=%s"
                cursor.execute(sql, (id_selection,))
                Dao.connection.commit()
                return cursor.rowcount > 0
        except Exception as e:
            print(f"Erreur lors de la suppression : {e}")
            return False
