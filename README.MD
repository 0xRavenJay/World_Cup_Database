# 🌍 World Cup Database

A PostgreSQL database project developed as part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/). This project focuses on designing relational database structures, importing CSV data using Bash scripts, and performing data analysis through SQL queries.

## Project Overview

The World Cup Database stores information about FIFA World Cup games from the final three rounds of tournaments since 2014.

The project demonstrates how to build a relational database, establish relationships between tables, automate data insertion, and retrieve meaningful information using SQL.

## Technologies Used

- **PostgreSQL** – Relational database management system.
- **SQL** – Database creation, manipulation, and querying.
- **Bash** – Automating CSV data imports and database operations.
- **CSV** – Source file containing World Cup game records.
- **Git & GitHub** – Version control and project storage.

## 🗄️ Database Structure

The database consists of two main tables:

### 1. Teams

| Column | Description |
|---|---|
| `team_id` | Primary key with SERIAL |
| `name` | Unique team name |

### 2. Games

| Column | Description |
|---|---|
| `game_id` | Primary key with SERIAL |
| `year` | Tournament year |
| `round` | Tournament round |
| `winner_id` | Foreign key referencing teams |
| `opponent_id` | Foreign key referencing teams |
| `winner_goals` | Goals scored by the winner |
| `opponent_goals` | Goals scored by the opponent |

### Database Relationships

The `games` table uses two foreign keys to reference the `teams` table. This allows each game to identify its winner and opponent without duplicating team information.

## What I Learned

### SQL and PostgreSQL
- Creating databases and relational tables.
- Using PRIMARY KEY and FOREIGN KEY constraints.
- Applying UNIQUE and NOT NULL constraints.
- Understanding one-to-many relationships.
- Using JOIN operations to retrieve related records.

### Bash Scripting
- Automating database operations using shell scripts.
- Reading and processing CSV files.
- Connecting Bash scripts to PostgreSQL.
- Executing SQL queries through the `PSQL` variable.
- Using scripts to insert records efficiently.

### SQL Data Analysis
Practiced aggregate functions and calculations:

- `COUNT()` – Counting records.
- `SUM()` – Calculating total goals.
- `AVG()` – Finding average goals.
- `MAX()` – Finding maximum values.
- `ROUND()` – Formatting decimal results.

### Debugging and Problem Solving
- Identifying duplicate team records.
- Preventing duplicate database entries.
- Troubleshooting SQL queries and foreign key relationships.
- Verifying database output against expected results.

## Project Files

| File | Description |
|---|---|
| `worldcup.sql` | Database backup containing SQL commands to rebuild the database. |
| `insert_data.sh` | Bash script that imports CSV records into PostgreSQL. |
| `queries.sh` | Bash script containing SQL queries for data analysis. |
| `games.csv` | Source dataset containing World Cup game information. |
| `expected_output.txt` | Reference output for validating SQL queries. |

## How to Run

1. Start PostgreSQL and open the terminal.
2. Restore the database:

```bash
psql -U postgres < worldcup.sql
```

3. Make the scripts executable:

```bash
chmod +x insert_data.sh queries.sh
```

4. Run the data insertion script if you want to import the CSV data again:

```bash
./insert_data.sh
```

5. Execute the analysis queries:

```bash
./queries.sh
```

## Project Goal

The goal of this project was to strengthen my understanding of relational databases and learn how to automate database operations using Bash and PostgreSQL.

Completing this project helped me develop practical skills in database management, SQL querying, scripting, and troubleshooting.

## 👨Author

**Raven Jay**

IT Graduate | Software Developer | Aspiring Cybersecurity Professional

Passionate about technology, database management, and software development, with a strong focus on continuously building skills toward a secure career in cybersecurity.

---

