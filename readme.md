# Online kuchařka

Jednoduchá webová aplikace pro sdílení a prohlížení receptů.

## Funkce

- Registrace a přihlášení uživatele  
- Prohlížení receptů podle kategorií  
- Vytváření vlastních receptů (pro přihlášené uživatele)  

## Jak aplikace funguje

### Nepřihlášený uživatel:
- může procházet recepty podle kategorií  

### Přihlášený uživatel:
- může vytvářet nové recepty

## Použité technologie

- HTML
- CSS
- JavaScript
- PHP
- MySQL databáze

## Spuštění projektu

1. Naklonuj repozitář:
```
git clone <url-repozitare>
```

2. Spusť XAMPP a zapni:
-   Apache
-   MySQL

3. Přesuň složku `main` do:
```
C:\xampp\htdocs
```
4. Otevřete phpMyAdmin:
 ```
http://localhost:<Apache port>/phpmyadmin
```

5. Vytvořte novou databázi `kucharka`

6. Importujte databázi:  
 
- vyberte databázi `kucharka`  
- klikněte na **Import**  
- vyberte soubor `kucharka.sql` ze složky `db`  
- potvrďte tlačítkem **Import**

7. Otevři aplikaci v prohlížeči:
```
http://localhost:<Apache port>/main/kucharka.php
