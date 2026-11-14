# cv06: dátový model

## Môj model

Môj dátový model je navrhnutý pre registračný formulár, kde používatelia zadávajú svoje osobné údaje, úroveň skúseností a obľúbené filmové žánre. Model obsahuje hlavnú entitu `users`, číselníky `experiences` a `genres`, a väzbovую tabuľku `user_genres` vo vzťahu M:N.

```mermaid
erDiagram
    users {
        int id PK
        varchar name
        varchar email
        date birth_date
        int experience_id FK
    }
    experiences {
        int id PK
        varchar name
    }
    genres {
        int id PK
        varchar name
    }
    user_genres {
        int user_id PK, FK
        int genre_id PK, FK
    }
    experiences ||--o{ users : "has"
    users ||--o{ user_genres : "has"
    genres ||--o{ user_genres : "belongs to"

## Čo sa stalo pri mazaní

1. Pri `UPDATE` hodnoty s `WHERE` sa úspešne zmenil konkrétny záznam v tabuľke.
2. Pri `DELETE` záznamu z hlavnej entity, ktorý sa nachádzzal v pivot tabuľke, sa záznam vďaka `ON DELETE CASCADE` úspešne vymazal.
3. Pri `DELETE` záznamu z lookup tabuľky, ktorý sa práve používa, databáza vyhodila chybu kvôli pravidlu `ON DELETE RESTRICT`.
4. Pri pokuse o `DROP TABLE` lookup tabuľky, na ktorú odkazuje cudzí kľúč, databáza hlásila chybu porušenia väzby (foreign key constraint).
5. Pri `DELETE` bez `WHERE` na pivot tabuľke sa vymazali všetky riadky a funkcia `COUNT(*)` vrátila nulu.
6. Pri `DROP TABLE` pivot tabuľky sa tabuľka úplne odstránila a následný `SELECT` z nej vrátil chybu neexistujúcej tabuľky.

## Posúdenie

Nesprávny je **Model B**, pretože:
1. **Multivalued stĺpec (`terrains`):** Obsahuje viacero hodnôt v jednom reťazci (napr. `'les, cesta'`), čím porušuje 1. normálnu formu[cite: 3, 5].
2. **Nevhodný dátový typ pre cenu (`price`):** Cena je uložená ako text s menou (`'12 €'`), čo pri 100 a viac bicykloch znemožňuje matematické operácie, výpočet priemeru či správne triedenie[cite: 3, 4, 5].
3. **Neštandardný formát dátumu (`since`):** Namiesto formátu dátumu je použitý slovný popis (napr. `'jar 2025'`), čo znemožňuje filtrovanie a časové analýzy[cite: 3, 4, 5].
