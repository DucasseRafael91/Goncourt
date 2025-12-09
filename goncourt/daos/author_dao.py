# -*- coding: utf-8 -*-

"""
Classe Dao[Address]
"""

from models.Author import Author
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional, List


@dataclass
class AuthorDao(Dao[Author]):
    def create(self, author: Author) -> int:
        pass

    def read(self, id_author: int) -> Optional[Author]:
        """Renvoi le cours correspondant à l'entité dont l'id est id_course
           (ou None s'il n'a pu être trouvé)"""
        author: Optional[Author]

        with Dao.connection.cursor() as cursor:
            sql = "SELECT * FROM g_auteur WHERE a_id=%s"
            cursor.execute(sql, (id_author,))
            record = cursor.fetchone()
        if record is not None:
            author = Author(record['a_nom'],record['a_prenom'])
            author.biography = record['a_biographie']
            author.id = id_author
        else:
            author = None

        return author

    def read_all(self) -> List[Author]:
        pass

    def update(self, address: Author) -> bool:
        pass
