#!/bin/bash

if test "$#" -ne 3; then
    echo "Poprawne użycie skryptu: "$0" [skrót zadania] [nazwa zadania] [link do zadania]"
    echo -n "Uwaga! Jeżeli w nazwie lub linku do zadania występują spacje lub znaki"
    echo " specjalne to należy otoczyć odpowiednio nazwę lub link cudzysłowiem."
    exit 1
fi


mkdir $1
cd $1

mkdir in
touch "in/"$1"1.in"

mkdir out
echo "Zrobione" > "out/"$1"1.out"

echo "title: "$2 >"config.yml"

mkdir doc
cd doc

echo '<html>
    <head>
        <meta http-equiv="refresh" content="0; url='$3'"/>
    </head>
    <body>
        <p><a href="'$3'">Redirect</a></p>
    </body>
</html>' >index.html
zip $1"zad.html.zip" index.html >/dev/null
rm index.html

cd ../..
zip -r $1".zip" $1 >/dev/null

rm -r $1
