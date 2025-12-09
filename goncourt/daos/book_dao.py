# -*- coding: utf-8 -*-

"""
Classe Dao[Address]
"""

from models.Book import Book
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional, List


@dataclass
class BookDao(Dao[Book]):
    def create(self, book: Book) -> int:
        pass

    def read(self, isbn_book: int) -> Optional[Book]:
        """Renvoi le cours correspondant à l'entité dont l'id est id_course
           (ou None s'il n'a pu être trouvé)"""
        book: Optional[Book]

        with Dao.connection.cursor() as cursor:
            sql = "SELECT * FROM g_livre WHERE l_isbn=%s"
            cursor.execute(sql, (isbn_book,))
            record = cursor.fetchone()
        if record is not None:
            book = Book(record['l_titre'], record['l_resume'], record['l_date_parution'], record['l_nombre_pages'], record['l_prix_editeur'])
            book.isbn = record['l_isbn']
        else:
            book = None

        return book

    def read_all(self) -> List[Book]:
        pass

    def update(self, address: Book) -> bool:
        pass
