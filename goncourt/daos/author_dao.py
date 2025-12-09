# -*- coding: utf-8 -*-

"""
Classe Dao[Address]
"""
from models.Author import Author
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional


@dataclass
class AuthorDao(Dao[Author]):

    def create(self, author_to_create: Author) -> int:
        try:
            with Dao.connection.cursor() as cursor:
                sql = """
                           INSERT INTO g_auteur (a_nom, a_prenom, a_biographie)
                           VALUES (%s, %s, %s)
                           VALUES (%s, %s, %s)
                       """
                cursor.execute(sql, (
                                     author_to_create.last_name,
                                     author_to_create.first_name,
                                     author_to_create.biography))

                author_id = cursor.lastrowid

            # Validation de l'insertion
            Dao.connection.commit()
            return author_id

        except Exception as e:
            print("Erreur lors de la création :", e)
            Dao.connection.rollback()
            return 0

    def read(self, id_author: int) -> Optional[Author]:
        """Renvoi le cours correspondant à l'entité dont l'id est id_course
           (ou None s'il n'a pu être trouvé)"""
        author_to_read: Optional[Author]

        with Dao.connection.cursor() as cursor:
            sql = "SELECT * FROM g_auteur WHERE a_id=%s"
            cursor.execute(sql, (id_author,))
            record = cursor.fetchone()
        if record is not None:
            author_to_read = Author(record['a_nom'], record['a_prenom'])
            author_to_read.biography = record['a_biographie']
            author_to_read.id = id_author
        else:
            author_to_read = None

        return author_to_read

    def update(self, author_to_update: Author) -> bool:
        try:
            with Dao.connection.cursor() as cursor:
                sql = """UPDATE g_auteur SET a_nom=%s, a_prenom=%s, a_biographie=%s, WHERE a_id=%s"""
                cursor.execute(sql, (
                    author_to_update.last_name,
                    author_to_update.first_name,
                    author_to_update.biography))

            Dao.connection.commit()

            return cursor.rowcount > 0

        except Exception as e:
            print("Erreur lors de la mise à jour :", e)
            Dao.connection.rollback()
            return False

    def delete(self, id_author: int) -> bool:
        try:
            with Dao.connection.cursor() as cursor:
                sql = "DELETE FROM g_auteur WHERE a_id=%s"
                cursor.execute(sql, (id_author,))
                Dao.connection.commit()
                return cursor.rowcount > 0
        except Exception as e:
            print(f"Erreur lors de la suppression : {e}")
            return False
