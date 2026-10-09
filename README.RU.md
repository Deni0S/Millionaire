# Кто хочет стать миллионером
[![Status](https://img.shields.io/badge/status-deprecated-red)](#)
[![Purpose](https://img.shields.io/badge/purpose-educational%20%2F%20history-blue)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)

> **Проект больше не поддерживается.**
> Оставлен как учебный для ознакомления и истории.
> Код может быть неполным, устаревшим или содержать учебные упрощения.

Игра-викторина, вдохновлённая известным телешоу **«Кто хочет стать миллионером?»**. Отвечайте на вопросы, поднимайтесь по лестнице призов и используйте классические подсказки, чтобы дойти до вершины.

## Скриншоты
<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="Screens/Screenshot_1_Dark.png">
    <source media="(prefers-color-scheme: light)" srcset="Screens/Screenshot_1_Light.png">
    <img alt="Начало игры" src="Screens/Screenshot_1_Dark.png" width="250">
  </picture>
  &nbsp;&nbsp;&nbsp;
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="Screens/Screenshot_2_Dark.png">
    <source media="(prefers-color-scheme: light)" srcset="Screens/Screenshot_2_Light.png">
    <img alt="Неправильный ответ" src="Screens/Screenshot_2_Dark.png" width="250">
  </picture>
  &nbsp;&nbsp;&nbsp;
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="Screens/Screenshot_3_Dark.png">
    <source media="(prefers-color-scheme: light)" srcset="Screens/Screenshot_3_Light.png">
    <img alt="Помощь друга" src="Screens/Screenshot_3_Dark.png" width="250">
  </picture>
</p>
<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="Screens/Screenshot_4_Dark.png">
    <source media="(prefers-color-scheme: light)" srcset="Screens/Screenshot_4_Light.png">
    <img alt="Помощь зала" src="Screens/Screenshot_4_Dark.png" width="250">
  </picture>
  &nbsp;&nbsp;&nbsp;
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="Screens/Screenshot_5_Dark.png">
    <source media="(prefers-color-scheme: light)" srcset="Screens/Screenshot_5_Light.png">
    <img alt="Правильный ответ" src="Screens/Screenshot_1_Dark.png" width="250">
  </picture>
  &nbsp;&nbsp;&nbsp;
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="Screens/Screenshot_6_Dark.png">
    <source media="(prefers-color-scheme: light)" srcset="Screens/Screenshot_6_Light.png">
    <img alt="Настройки игры" src="Screens/Screenshot_6_Dark.png" width="250">
  </picture>
</p>

## Возможности

- 🎯 **Вопросы с вариантами ответов** — четыре варианта на выбор
- 🟢 **Правильный ответ** подсвечивается зелёным
- 🔴 **Неправильный ответ** подсвечивается красным
- 💰 **Лестница призов** — каждый правильный ответ увеличивает выигрыш
- 📞 **Звонок другу** — позвоните виртуальному другу за подсказкой
- 👥 **Помощь зала** — узнайте, как проголосовал бы зал
- 🏁 **Конец игры** — игра заканчивается после первого неправильного ответа

## Подсказки

| Подсказка | Описание |
|-----------|----------|
| 📞 **Звонок другу** | Виртуальный друг предлагает наиболее вероятный ответ |
| 👥 **Помощь зала** | Показывает распределение голосов зала |

Каждую подсказку можно использовать **только один раз за игру**.

## Как работает игра

1. Игрок начинает с первого вопроса лестницы призов.
2. Показываются четыре варианта ответа.
3. Игрок выбирает один ответ.
4. После выбора:
   - **правильный ответ подсвечивается зелёным**;
   - если игрок ошибся, **выбранный ответ подсвечивается красным**;
5. Правильный ответ → подъём по лестнице.
6. Неправильный ответ → игра заканчивается, и игрок забирает последнюю гарантированную сумму.
7. Игрок может использовать подсказки в любой момент до ответа.

## Подсветка ответов

| Цвет | Значение |
|------|----------|
| 🟢 Зелёный | Правильный ответ |
| 🔴 Красный | Неправильный ответ, выбранный игроком |
| 🔵 Синий | Ответ не выбран |
