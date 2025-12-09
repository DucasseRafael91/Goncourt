#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Application de gestion d'une école
"""
from datetime import date

from business.goncourt import Goncourt
from models import Book
from models.selection_livre import SelectionLivre


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
            print_books(goncourt)
        elif choice == "2":
            indicate_selection(goncourt,2)
        elif choice == "3":
            indicate_selection(goncourt,3)
        elif choice == "4":
            books = goncourt.get_all_books_by_selection(3)
            print("Livres de la sélection 3 :")
            index = 1
            for book in books:
                print(f"{index}-{book}")
                index += 1
            print("Veuillez indiquer le nombre de votes obtenus par chaque livre :")
            for book in books:
                votes = int(input(f"Nombre de votes pour le livre '{book.title}': "))
                book.nbr_votes = votes
                goncourt.update_book(book)
                print(f"Le livre '{book.title}' a obtenu {book.nbr_votes} votes.")



        elif choice == "5":
            print("Au revoir!")
            break
        else:
            print("Choix invalide, veuillez taper 1, 2 ou 3.")


def print_books(goncourt: Goncourt):
    for i in range(1, 4):
        books = goncourt.get_all_books_by_selection(i)
        print(f"\nLivres de la sélection {i} :")
        for book in books:
            print(f"-{book}")
    books = goncourt.get_all_books_by_selection(4)
    print("Livre Lauréat :")
    print(f"{books[0]}")


def indicate_selection(goncourt: Goncourt, selection_number: int):
    books = goncourt.get_all_books_by_selection(selection_number - 1)
    print(f"Livres de la sélection {selection_number - 1} :")
    index = 1
    for book in books:
        print(f"{index} {book}")
        index = index + 1
    goncourt.delete_selection_book_by_selection_id(selection_number)
    print(f"Choisissez les livres qui doivent faire partie de la {selection_number}eme selection :")
    if selection_number == 2:
        num_books = 8
    else:
        num_books = 4
    assign_book_to_selection(books, goncourt, num_books, selection_number)


def assign_book_to_selection(books: list[Book], goncourt: Goncourt, num_books: int, selection_number: int):
    for i in range(1, num_books + 1):
        book_chosen = int(input(f"Tapez le numéro du livre {i} : "))
        selected_book = books[book_chosen - 1]
        selectionLivre = SelectionLivre(selected_book)
        selectionLivre.selection = selection_number
        goncourt.create_selection_book(selectionLivre)


if __name__ == '__main__':
    main()
