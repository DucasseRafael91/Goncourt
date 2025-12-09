# -*- coding: utf-8 -*-

"""
Classe Dao[Address]
"""
from IPython.core.release import author

from daos.author_dao import AuthorDao
from daos.editor_dao import EditorDao
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
            editorDao: EditorDao = EditorDao()
            book.editor = editorDao.read(record[1])
            print(book)
        else:
            book = None

        return book

    def read_by_selection(self, id_selection: int) -> List[Book]:
        """Renvoie toutes les adresses présentes dans la table 'address'."""
        books: List[Book] = []
        with Dao.connection.cursor() as cursor:
            sql = ("SELECT * FROM g_livre INNER JOIN g_selection_livre ON l_isbn = s_fk_livre_isbn WHERE s_fk_selection_id=%s ORDER BY "
                   "s_fk_selection_id")
            cursor.execute(sql, (id_selection,))
            records = cursor.fetchall()

        for record in records:

            book = Book(record['l_titre'], record['l_resume'], record['l_date_parution'], record['l_nombre_pages'],record['l_prix_editeur'])
            book.isbn = record['l_isbn']
            editorDao: EditorDao = EditorDao()
            book.editor = editorDao.read(record['l_fk_id_editeur'])
            authorDao: AuthorDao = AuthorDao()
            book.author = authorDao.read(record['l_fk_id_auteur'])
            books.append(book)

        return books

    def update(self, book: Book) -> bool:
        """Met à jour en BD l'entité Course correspondant à course

                :param address: cours déjà mis à jour en mémoire
                :return: True si la mise à jour a pu être réalisée
                """
        try:
            with Dao.connection.cursor() as cursor:
                sql = """UPDATE g_livre SET l_titre=%s, l_resume=%s, l_date_parution=%s, l_nombre_pages=%s , 
                l_prix_editeur=%s , l_fk_id_editeur=%s , l_fk_id_auteur=%s , l_nbr_votes=%s WHERE l_isbn=%s"""
                cursor.execute(sql, (
                    book.title,
                    book.resume,
                    book.publication_date,
                    book.pages,
                    book.editor_price,
                    book.editor.id,
                    book.author.id,
                    book.nbr_votes,
                    book.isbn

                ))

            Dao.connection.commit()

            return cursor.rowcount > 0

        except Exception as e:
            print("Erreur lors de la mise à jour :", e)
            Dao.connection.rollback()
            return False
