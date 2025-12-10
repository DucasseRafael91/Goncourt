# -*- coding: utf-8 -*-

"""
Classe School
"""

from dataclasses import dataclass
from typing import Optional
from daos.book_dao import BookDao
from models.Book import Book
from daos.selection_livre_dao import SelectionLivreDao
from models.selection_livre import SelectionLivre

@dataclass
class Goncourt:
    """Couche métier de l'application de gestion d'une école,
    reprenant les cas d'utilisation et les spécifications fonctionnelles :
    - courses : liste des cours existants
    - teachers : liste des enseignants
    - students : liste des élèves"""

    @staticmethod
    def get_laureat_book_by_id_selection() -> Optional[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read_laureat_book()

    @staticmethod
    def get_all_books_by_selection(id_selection: int) -> list[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read_by_selection(id_selection)

    @staticmethod
    def get_nbr_votes_by_selection(id_isbn: int) -> Optional[int]:
        selection_livre_dao: SelectionLivreDao = SelectionLivreDao()
        return selection_livre_dao.read_by_isbn(id_isbn)

    @staticmethod
    def create_selection_book(selection_livre: SelectionLivre) -> int:
        selection_livre_dao: SelectionLivreDao = SelectionLivreDao()
        return selection_livre_dao.create(selection_livre)

    @staticmethod
    def update_selection_book(book: Book) -> int:
        selection_book: SelectionLivreDao = SelectionLivreDao()
        return selection_book.update(book)

    @staticmethod
    def update_nbr_votes_selection_book() -> int:
        selection_book: SelectionLivreDao = SelectionLivreDao()
        return selection_book.delete_nbr_votes()

    @staticmethod
    def delete_selection_book_by_selection_id(id_selection: int) -> bool:
        selection_livre_dao: SelectionLivreDao = SelectionLivreDao()
        return selection_livre_dao.delete(id_selection)
