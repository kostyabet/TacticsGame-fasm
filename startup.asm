format PE Console ; говорим компилятору FASM какой файл делать

entry start ; говорим windows-у где из этой каши стартовать программу.

include 'include/win32a.inc' ; подключаем библиотеку FASM-а
;можно и без нее но будет очень сложно.

section '.data' data readable writeable ; секция данных

	hello db 'hello world!',0 ; наша строка которую нужно вывести

section '.code' code readable writeable executable ; секция кода

start: ; метка старта
	invoke printf, hello ; вызываем функцию printf
  
  invoke getch ; вызываем её для того чтоб программа не схлопнулась
  ;то есть не закрылась сразу.
  
  invoke ExitProcess, 0 ; говорим windows-у что у нас программа закончилась
  ; то есть нужно программу закрыть (завершить)

section '.idata' data import readable ; секция импорта
        library kernel, 'kernel32.dll',\ ; тут немного сложней, объясню чуть позже
                msvcrt, 'msvcrt.dll'
  
  import kernel,\
  				ExitProcess, 'ExitProcess'
          
  import msvcrt,\
  				printf, 'printf',\
          getch, '_getch'