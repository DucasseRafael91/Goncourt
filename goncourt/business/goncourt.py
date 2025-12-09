# -*- coding: utf-8 -*-

"""
Classe School
"""

from dataclasses import dataclass, field

from typing import Optional

from daos.editor_dao import EditorDao
from models.Editor import Editor
from daos.book_dao import BookDao
from models.Book import Book



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

    @staticmethod
    def get_book_by_id(id_book: str) -> Optional[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read(id_book)

    @staticmethod
    def get_all_books_by_selection(id_selection: int) -> list[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read_by_selection(id_selection)

