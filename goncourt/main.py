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
            for i in range(1, 4):
                books = goncourt.get_all_books_by_selection(i)
                print(f"\nLivres de la sélection {i} :")
                for book in books:
                    print(f"-{book}")
            books = goncourt.get_all_books_by_selection(4)
            print("Livre Lauréat :")
            print(f"{books[0]}")
        elif choice == "2":
            books = goncourt.get_all_books_by_selection(1)
            print("Livres de la sélection 1 :")
            index=1
            for book in books:
                print(f"{index} {book}")
                index=index+1
            goncourt.delete_selection_livre_by_selection_id(2)
            print("Choisissez les 8 livres qui doivent faire partie de la deuxiéme selection :")
            for i in range(1, 9):
                book_choosen = int(input(f"Tapez le numéro du livre {i} : "))
                selected_book = books[book_choosen - 1]
                selectionLivreDao = SelectionLivreDao()
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
