#!/bin/bash

if [[ "$#" -ne 3 ]]; then
    echo -n "script usage: "
    echo -n $(basename "$0")
    echo " [skrót zadania] [nazwa zadania] [link do zadania]"
    exit 1
fi

mkdir $1
cd $1

mkdir in
touch "in/${1}1.in"

mkdir out
echo "Zrobione" > "out/${1}1.out"

echo "title: ${2}" >"config.yml"

mkdir doc
cd doc

pom1='<html>
    <head>
        <meta http-equiv="refresh" content="0; url='

pom2='" />
    </head>
    <body>
        <p><a href="'

pom3='">Redirect</a></p>
    </body>
</html>'

echo "${pom1}${3}${pom2}${3}${pom3}" >index.html
zip "${1}zad.html.zip" index.html >/dev/null
rm index.html

cd ../..
zip -r "${1}.zip" "${1}" >/dev/null

rm -r "${1}"
            
