@echo off
title Compilador
cd "*/analizador" || GOTO error2
echo Ejecutando JJTREE...
call jjtree "compilador.jjt" || GOTO error
echo Ejecutando JAVACC...
call javacc "compilador.jj" || GOTO error
echo Compilando archivos...
call javac *.java || GOTO error
echo Todas las operaciones han sido completadas correctamente
GOTO exit
:error
echo Se han detectado errores durante la ejecucion, revise los errores encontrados y vuelva a intentarlo
GOTO exit;
:error2
echo Nota: Todos los archivos deben ubicarse en una carpeta llamada "analizador" a excepcion de este programa
:exit
echo Pulse una tecla para salir...
pause >nul
exit