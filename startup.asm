format          PE GUI 4.0                                                      ; Формат PE. Версия GUI 4.0.
entry           start                                                           ; Точка входа
include         'include/win32a.inc'                                          ; Делаем стандартное включение описателей.

_style           equ             WS_VISIBLE+WS_DLGFRAME+WS_SYSMENU              ; Стили окна. ЭКВИВАЛЕНТЫ должны задаваться ДО основного кода

;=== сегмент кода ============================================================
 
section         '.text' code readable executable
 
  start: 
                invoke          GetModuleHandle,0                               ; Получим дескриптор приложения.
                mov             [wc.hInstance],eax                              ; Сохраним дескриптор приложения в поле структуры окна (wc)
                invoke          LoadIcon,0,IDI_ASTERISK                         ; Загружаем стандартную иконку IDI_ASTERISK
                mov             [wc.hIcon],eax                                  ; Сохраним дескриптор иконки в поле структуры окна (wc)
                invoke          LoadCursor,0,IDC_ARROW                          ; Загружаем стандартный курсор IDC_ARROW
                mov             [wc.hCursor],eax                                ; Сохраним дескриптор курсора в поле структуры окна (wc)
                mov             [wc.lpfnWndProc],WindowProc                     ; Зададим указатель на нашу процедуру обработки окна
                mov             [wc.lpszClassName],_class                       ; Зададим имя класса окна
                mov             [wc.hbrBackground],COLOR_WINDOW+1               ; Зададим цвет кисти
                invoke          RegisterClass,wc                                ; Зарегистрируем наш класс окна
                test            eax,eax                                         ; Проверим на ошибку (eax=0).
                jz              error                                           ; Если 0, то ошибка - прыгаем на error.
		
                invoke          CreateWindowEx,0,_class,_title,_style,128,128,256,192,NULL,NULL,[wc.hInstance],NULL  ; Создадим экземпляр окна на основе зарегистрированного класса. в eax возвращает дескриптор окна.
                test            eax,eax                                         ; Проверим на ошибку (eax=0).
                jz              error                                           ; Если 0, то ошибка - прыгаем на error.
		
                mov             [wHMain],eax                                    ; сохраним дескриптор созданного окна
 
;--- цикл обработки сообщений ------------------------------------------------

  msg_loop:
                invoke          GetMessage,msg,NULL,0,0                         ; Получаем сообщение из очереди сообщений приложения
                or              eax,eax                                         ; Сравнивает eax с 0
                jz              end_loop                                        ; Если 0 то пришло сообщение WM_QUIT - выходим из цикла ожидания сообщений, если не 0 - продолжаем обрабатывать очередь
  msg_loop_2:
                invoke          TranslateMessage,msg                            ; Дополнительная функция обработки сообщения. Конвертирует сообщения клавиатуры отправляет их обратно в очередь.
                invoke          DispatchMessage,msg                             ; Пересылает сообщения соответствующим процедурам обработки сообщений (WindowProc ...).
                jmp             short msg_loop                                  ; Зацикливаемся
  error:
                invoke          MessageBox,NULL,_error,NULL,MB_ICONERROR+MB_OK  ; Выводим окно с ошибкой
  end_loop:
                invoke          ExitProcess,[msg.wParam]                        ; Выход из программы.

;--- процедура обработки сообщений окна (функция окна, оконная процедура, оконная функция)

proc            WindowProc      hWnd,wMsg,wParam,lParam
                push            ebx esi edi                                     ; сохраним все регистры
                cmp             [wMsg],WM_DESTROY                               ; Проверим на WM_DESTROY
                je              .wmdestroy                                      ; на обработчик wmdestroy
                cmp             [wMsg],WM_CREATE                                ; Проверим на WM_CREATE
                je              .wmcreate                                       ; на обработчик wmcreate
  .defwndproc:
                invoke          DefWindowProc,[hWnd],[wMsg],[wParam],[lParam]   ; Функция по умолчанию. Обрабатывает все сообщения, которые обрабатывает наш цикл.
                jmp             .finish 
  .wmcreate:
                xor             eax,eax
                jmp             .finish
  .wmdestroy:                                                                   ; Обработчик сообщения WM_DESTROY. Обязателен.
                invoke          PostQuitMessage,0                               ; Посылает сообщение WM_QUIT в очередь сообщений, что вынуждает GetMessage вернуть 0. Посылается для выхода из программы. Посылается только основным окном.
                xor             eax,eax                                         ; Если наша процедура окна обрабатывает какое-либо сообщение, то она должна вернуть в eax 0. Иначе программа поведет себя непредсказуемо.
  .finish:
                pop             edi esi ebx                                     ; восстановим все регистры
                ret
endp

;=== сегмент данных ==========================================================

section         '.data' data readable writeable

_class          db              'FASMWIN32',0                                   ; Название собственного класса.
_title          db              'Win32 program template',0                      ; Текст в заголовке окна.
_error          db              'Startup failed.',0                             ; Текст ошибки

wHMain          dd              ?                                               ; дескриптор окна
 
wc              WNDCLASS                                                        ; Структура окна. Для функции RegisterClass
msg             MSG                                                             ; Структура системного сообщения, которое система посылает нашей программе.

;=== таблица импорта =========================================================
section         '.idata' import data readable writeable

library         kernel32,'KERNEL32.DLL',user32,'USER32.DLL'

import		kernel32,\
		GetModuleHandle,'GetModuleHandleA',\
		ExitProcess,'ExitProcess'

import		user32,\
		LoadIcon,'LoadIconA',\
		LoadCursor,'LoadCursorA',\
		RegisterClass,'RegisterClassA',\
		CreateWindowEx,'CreateWindowExA',\
		GetMessage,'GetMessageA',\
		TranslateMessage,'TranslateMessage',\
		DispatchMessage,'DispatchMessageA',\
		MessageBox,'MessageBoxA',\
		DefWindowProc,'DefWindowProcA',\
		PostQuitMessage,'PostQuitMessage'