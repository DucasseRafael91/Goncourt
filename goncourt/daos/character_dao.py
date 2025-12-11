# -*- coding: utf-8 -*-

"""
Classe Dao[Address]
"""
from daos.dao import Dao
from dataclasses import dataclass
from typing import Optional, List
from models.Character import Character

@dataclass
class CharacterDao(Dao[Character]):
    
    def read(self, id_isbn: int) -> List[Character]:
        """Renvoie toutes les adresses présentes dans la table 'address'."""
        characters: List[Character] = []
        with Dao.connection.cursor() as cursor:
            sql = ("SELECT p_nom FROM g_personnage  WHERE "
                   "p_fk_livre_isbn=%s ")
            cursor.execute(sql, (id_isbn,))
            records = cursor.fetchall()

        for record in records:
            character = Character(record['p_nom'])
            characters.append(character)

        return characters

    def create(self, id_entity: int) -> Optional[Character]:
        # TODO document why this method is empty
        pass
    
    def update(self, id_entity: int) -> Optional[Character]:
        # TODO document why this method is empty
        pass
    
    def delete(self, id_entity: int) -> Optional[Character]:
        # TODO document why this method is empty
        pass
