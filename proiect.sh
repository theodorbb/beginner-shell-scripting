#!/bin/bash

x=9
trecut=0

deschidereCSV(){
	awk -F, '{print $1",", ($2+$3)/2}' studenti.csv
}
ex1(){
	deschidereCSV
	trecut=1
}
ex2(){
	if [ $trecut -eq 1 ] #verificam daca a fost rulat primul subpunct
	then
		deschidereCSV > medii.txt
		echo "Medii salvate cu succes!"
	else
		echo "Mai intai rulati subpunctul 1"
	fi
}
ex3(){

	free -m | sed "s/total/total/" | sed "s/used/folosit/" | sed "s/free/liber/" | sed "s/shared/impartit/" | sed "s/available/disponibil/"
}
ex4(){
	printf "Introduceti un cuvant:"
	read cuvant
	if [ -z "$cuvant" ]
	then
		echo "Trebuie introdus un cuvant"
	else
		printf "Introduceti un fisier:"
		read fisier
		if [ -z "$fisier" ]
		then
			echo "Trebuie introdus un fisier"
		else	
			#verificare daca exista fisierul 
			if [ -f "$fisier" ]
			then
				printf "Cuvantul $cuvant apare in fisierul $fisier de atatea ori: "
				cat $fisier | grep $cuvant | wc -l		
			else
				echo "Fisierul nu exista!"
			fi
		fi
	fi
}
while [ "$x" != "q" ]
do
	printf "1. Deschiderea unui fisier CSV dat care contine pe fiecare linie studentul urmat de 2 note ale acestuia. Se va afisa media notelor pentru fiecare student\n"
	printf "2. Salvarea mediilor calculate intr-un fisier separat\n"
	printf "3. Afisarea outputului comenzii 'free -m' in care capul de tabel sa fie in limba romana\n"
	printf "4. Numararea liniilor care contin un cuvant cerut de la utilizator dintr-un fisier cerut tot de la tastatura\n"
	printf "q. Exit\n"
	printf "Dati optiune:"
	read -n1 x 
	echo ;
		case $x in
			"1")
				ex1
				;;
			"2")
				ex2
				;;
			"3")
				ex3
				;;
			"4")
				ex4
				;;
			"q")
				echo "La revedere!"
				exit
				;;
			*)
				printf "Optiune invalida"
				;;
		esac
read -n1 n;
clear
done

