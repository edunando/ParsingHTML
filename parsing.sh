#!/bin/bash

#MENU PRINCIPAL

if [ "$1" == "" ]
then
    echo -e "\033[0;35m ____                _             _   _ _____ __  __ _     
|  _ \ __ _ _ __ ___(_)_ __   __ _| | | |_   _|  \/  | |    
| |_) / _ | __/ / __| | _ \ / _ | |_| | | | | |\/| | | |  
|  __/ (_| | |  \__ \ | | | | (_| |  _  | | | | |  | | |___ 
|_|   \__,_|_|  |___/_|_| |_|\__, |_| |_| |_| |_|  |_|_____|
                             |___/           \033[0m"
echo ""
    echo -e "\033[1;33m#################################################\033[0m"    
    echo -e "\033[1;33m          Modo de Uso: $0 URL                  \033[0m"
    echo -e "\033[1;33m Exemplo: $0 www.site-exemplo.com              \033[0m"
    echo -e "\033[1;33m#################################################\033[0m"
else
    echo -e "\033[0;35m ____                _             _   _ _____ __  __ _     
|  _ \ __ _ _ __ ___(_)_ __   __ _| | | |_   _|  \/  | |    
| |_) / _ | __/ / __| | _ \ / _ | |_| | | | | |\/| | | |  
|  __/ (_| | |  \__ \ | | | | (_| |  _  | | | | |  | | |___ 
|_|   \__,_|_|  |___/_|_| |_|\__, |_| |_| |_| |_|  |_|_____|
                             |___/           \033[0m"
echo ""
#REALIZANDO BUSCA DOS HOSTS
echo -e "\033[1;33m#################################################\033[0m"
echo -e "\033[1;33m#----------------BUSCANDO HOSTS-----------------#\033[0m"
echo -e "\033[1;33m#################################################\033[0m"    

wget $1 &> /dev/null 
grep -o 'href=["'\''][^"'\'']*' index.html | sed -n 's/.*\/\/\([^\/]*\).*/\1/p' | sort -u > hosts-found.txt
file="hosts-found.txt"
cat $file

echo " "
echo -e "\033[1;33m###################################################\033[0m"
echo -e "\033[1;33m#----------------RESOLVENDO HOSTS-----------------#\033[0m"
echo -e "\033[1;33m###################################################\033[0m"  
#REALIZANDO A LEITURA DO ARQUIVO
if [ -e "$file" ]; then

    while read  linha; do
        #REALIZANDO A CONSULTA
        host $linha | grep -v "error"
    done < $file
    rm index.html
    rm hosts-found.txt
else
    echo "O arquivo $file não existe."
fi
fi

