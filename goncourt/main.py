
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

    print(goncourt.get_all_books())


if __name__ == '__main__':
    main()
