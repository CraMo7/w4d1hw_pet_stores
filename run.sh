createdb petsbwe;
psql -d petsbwe -f sql_setup.sql
for file in specs/*.rb; do echo "#########################"; echo $file; ruby $file; echo $file; echo "#########################"; done
ruby petsBwe.rb