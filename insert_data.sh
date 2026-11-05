#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Insert unique teams
TEAM_VALUES=$(awk -F, 'NR > 1 { print $3; print $4 }' games.csv |
  sort -u |
  awk '{ printf "('\''%s'\'')," , $0 }' |
  sed 's/,$//')

$PSQL "INSERT INTO teams(name) VALUES $TEAM_VALUES ON CONFLICT(name) DO NOTHING"

# Insert games
GAME_VALUES=""

while IFS="," read -r year round winner opponent winner_goals opponent_goals
do
  if [[ $year == "year" ]]
  then
    continue
  fi

  GAME_VALUES+="($year, '$round',
    (SELECT team_id FROM teams WHERE name = '$winner'),
    (SELECT team_id FROM teams WHERE name = '$opponent'),
    $winner_goals, $opponent_goals),"
done < games.csv

# Remove last comma
GAME_VALUES=${GAME_VALUES%,}

# Insert all games
$PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES $GAME_VALUES"
