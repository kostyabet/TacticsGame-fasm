# Tactics Game - игра-головоломка

<img src="source\favicon.ico" width="250">

![Static Badge](https://img.shields.io/badge/Flat_Assembler-1.73.32-pink)
![Static Badge](https://img.shields.io/badge/OllyDbg-1.10-pink)
![Static Badge](https://img.shields.io/badge/Node_Js-20.18.0-pink)
![Static Badge](https://img.shields.io/badge/npm-10.8.2-pink)
![Static Badge](https://img.shields.io/badge/Go-1.23.2-pink)

<h3>Советская игра сувенир-головоломка написана на FLAT Assembler под Windows с использованием <a href="https://learn.microsoft.com/ru-ru/windows/win32/api/">WinAPI</a> и <a href="https://www.opengl.org/">OpenGL</a>.</h3>

## Установка

Вы можете использовать последнюю `Relese` версию для игры:
1. Скачайте `tacticsgame.zip` из файлов последнего релиза;
2. Разархивируйте папку с игрой в удобное для вас место.

## Играть
1. Откройте папку с файлами игры.
2. Двойное левое нажатие кнопки мыши по `*.exe` файлу.
3. Играйте!!!

## Работа с кодом

Если вы хотите поработать с моим кодом, то вы можете использовать следующие методы:
1. Установите `FASM` на ваш компьютер используя <a href="https://flatassembler.net/download.php">эту ссылку</a>.
2. Откройте `FASMW.exe` и вы уже можете писать код.

Но если более удобный способ писать код с использованием `FASM Editor 2.0`.
1. Установите `FASM Editor 2.0` через <a href="https://fasmworld.ru/instrumenty/fasm-editor-2-0/">эту ссылку</a>.
2. Нажмите на `FEditor.exe`.
3. В первую очередь посетите настройки `Services\Settings`.
  - `FASM`: пусть к `FASM.exe`;
  - `INC`: путь к `INCLUDE` папке `FASM`;
  - `DBG`: путь к `*.exe` с отладчиком.

Ну и если вы хотите писать код, так, как писал его я:
1. Установите `VSCode` через <a href="https://code.visualstudio.com/download">эту ссылку</a>;
2. Клонируйте мой проект к себе на устройство;
3. Пропишите `npm install` для установки зависимостей;
4. Измените `setup.json` - под ваши пути;
5. Добавьте FASM в переменный среды текущего пользователя;
6. `node build` | `node build Debug` | `node build Release` - виды сборок проекта;
    - `node build` == `node build Debug`;
7. `node run` | `node run Debug` - для запуска Отладочной версии или `node run Release` для Финальной версии.

## Устройство серверной части

Сервер состоит из двух частей:
1. `REST API` `Go` микросервис;
2. `PostgresSQL` база данных.

REST API была написана на языке Go и содержит в себе следующие маршруты:
- `POST`-`/players` - добавление нового пользователя;                  
- `GET`-`/players` - проверка пользователя на существование;
- `POST`-`/scores` - добавление нового результата пользователя;
- `GET`-`/scores` - получение лучших результатов конкретного пользователя;
- `GET`-`/scorescount` - количество прохождений пользователем;
- `GET`-`/bestscores` - лучшие результаты среди всех пользователей.

Оба микросервиса находятся в одной сети и располагаются на хостинге по адресу: http://tactics.tw1.su/.
Для сборки сервиса на сервере использовался `Docker`.

## Отладчик

Вы можете использовать `Olly Dbg`. Скачать можно <a href="https://www.ollydbg.de/">здесь</a>.

## Благодарность
### Если Вам понравился данный проект, пожалуйста, поставьте звёздочку :)