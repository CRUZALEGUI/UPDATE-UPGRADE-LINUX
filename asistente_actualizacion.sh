#!/bin/bash
bienvenida() {
clear
echo '|||   ||    /\ [||||||||]||    || /|||||\'
echo '||\\  ||   //\\    ||    ||    || ||'
echo '|| \\ ||  //  \\   ||    ||    || \|||||\'
echo '||  \\|| //====\\  ||    ||    ||      ||'
echo '||   \\|//      \\ ||    |||||||| \|||||/'
echo ' '
echo '        [||||||||]||||||| ||||||| ||   ||'
echo '            ||    ||      ||      ||   ||'
echo '            ||    ||||||| ||      |||||||'
echo '            ||    ||      ||      ||   ||'
echo '            ||    ||||||| ||||||| ||   ||'
echo ''
}

es_root(){
	if [[ $EUID -ne 0 ]]
	then
		echo "Este escrip debe ejecutarse como root"
	else
		echo "Estas como root"
	fi
}
actualizar() {
sudo apt update
}
upgrade() {
sudo apt upgrade
}
usuario=$(whoami)
salir() {
echo " "
echo "Gracias por la preferencia" $usuario
exit 0
}
mostrar_menu() {
echo "  "
echo "--------------------------------"
echo "|  ASISTENTE DE ACTUALIZACIÓN  |"
echo "|                              | "
echo "|                              |"
echo "|  1. ACTUALIZAR REPOSITORIOS  |"
echo "|  2. 'UPGRADE' AL SISTEMA     |"
echo "|  3. MANUAL DEL ASISTENTE     |"
echo "|  4. SALIR DEL ASISTENTE      |"
echo "|                              |"
echo "|------------------------------|"
}

manual() {
clear
echo "|========================|"
echo "|  MANUAL DEL ASISTENTE  |"
echo "|========================|"
echo " "
echo " "
echo "Primero debe seleccionar la opción, escribirla"
sleep 1s
echo "y presionar enter para ejecutar la accion."
sleep 5s
}

leer_opcion() {
local eleccion
read -p "Escriba la opcion [1-4]: " eleccion
	case $eleccion in
	 1) actualizar ;;
	 2) upgrade ;;
	 3) manual ;;
	 4) salir ;;
	 *) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

trap '' SIGINT SIGQUIT SIGTSTP

while true
do
	bienvenida
	mostrar_menu
	leer_opcion
done
