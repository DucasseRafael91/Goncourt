#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Application de gestion d'une école
"""
from datetime import date

from business.goncourt import Goncourt
from models.Editor import Editor


def main() -> None:
    """Programme principal."""
    print("""\
--------------------------
Bienvenue dans le prix Goncourt
--------------------------""")

    goncourt: Goncourt = Goncourt()

    while True:
        print("\nVeuillez choisir une option :")
        print("1 - Voir tous les livres sélectionnés au prix Goncourt")
        print("2 - Indiquer les livres faisant partie de la deuxième selection")
        print("3 - Indiquer les livres faisant partie de la troisième selection")
        print("4 - Indiquer le nombre de votes obtenus par chaque livre présent au dernier tour de scrutin")
        print("5 - Quitter")

        choice = input("Tapez 1, 2 ou 3 : ")

        if choice == "1":
            print("\nListe des livres :")
            print(goncourt.get_all_books())
        elif choice == "2":
            pass
        elif choice == "3":
            pass
        elif choice == "4":
            pass
        elif choice == "5":
            print("Au revoir!")
            break
        else:
            print("Choix invalide, veuillez taper 1, 2 ou 3.")


if __name__ == '__main__':
    main()
