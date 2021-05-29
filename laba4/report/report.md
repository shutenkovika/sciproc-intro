---
# Front matter
lang: ru-RU
title: "Лабораторная работа 4"
subtitle: "hoi"
author: "Шутенко В.М. группа НФИ-03-19"

# Formatting
toc-title: "Содержание"
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: true
pdf-engine: lualatex
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Приобрести практические навыки работы с системами линейных уравнений в Octave.

# Выполнение лабораторной работы

## 4.4.1. Метод Гаусса

1. После внимательного изучения методички я приступила к выполнению заданий. Сначала я делала 4.4.1. 
- Для заданной матрицы А надо было построить расширенную. Для этого я использовала команду B = [ 1 2 3 4 ; 0 -2 -4 6 ; 1 -1 0 0 ]. (Рисунок 1)
- Я просматрела ее поэлементно: >> B (2, 3). Ответ получился ans = -4. Он являетяся скаляром, находящимся на строке 2, столбце 3. Также я извлекла целый вектор строки первой строки, используя >> B (1, :). Получился ответ ans = 1 2 3 4, вывевший первую строку заданной матрицы. (Рисунок 1)
- Далее я реализовала метод Гаусса. Сначала добавила к третьей строке первую строку, умноженную на -1: >> B(3,:) = (-1) * B(1,:) + B(3,:). В полученной в ответе матрице таким способом получилось избавиься от 1 в 3 строке.
- Теперь я добавила к третьей строке вторую строку, умноженную на -1.5: >> B(3,:) = -1.5 * B(2,:) + B(3,:). Так я избавилась от -3 в 3 строке. Теперь матрица имеет треугольный вид. Потом я расчитала х1, х2 и х3 просто выражая их друг через друга. (Рисунки 1-2). В результате получила ответы, схожие с методичкой.
- Далее через Octave выполнила поиска треугольной формы матрицы: >> rref(B). В полученном ответе я заметила тот факт, что все числа записываются в виде чисел с плавающей точкой (то есть десятичных дробей). Пять десятичных знаков отображаются по умолчанию. Переменные на самом деле хранятся с более высокой точностью. Я отобразила больше десятичных разрядов, используя >> format long >> rref(B). Потом я вернула предыдущий формат представления: >> format short (Рисунок 2).

![Рисунок 1: задание расшириной матрицы В; просмотр ее элементов; реализация метода Гаусса для приведения матрицы к треугольному виду; поиск через выражение х3 и х2](images/image1.png)

![Рисунок 2: поиск через выражение х1; вывод столбца полученных значений х1, х2 и х3;поиск треугольной матрицы командой rref; перевод в большую точность и возвращение к исходному](images/image2.png)

## 4.4.2. Левое деление

2. Далее я работала с левым делением. 
- Встроенная операция для решения линейных систем вида Ах=b в Octave называется левым делением и завписывается как A \backslash b. Это концептуально эквивалентно выражению обратной матрицы. Выделила из расширенной матрицы B матрицу A: >> A = B(:,1:3) и вектор b: >> b = B (:,4). (Рисунок 3)
- После я нашла вектор х >> A \backslash b.

![Рисунок 3: левое деление](images/image3.png)

## 4.4.3. LU-разложение

3. С помощью Octave нужно было расписать заданную матрицу и её LU-разложение.
- LU-разложение — это вид факторизации матриц для метода Гаусса. Необходимо записать матрицу A в виде: A = LU, 
- где L — нижняя треугольная матрица, а U — верхняя треугольная матрица.
- LU-разложение существует только в том случае, когда матрица A обратима, а все главные миноры матрицы A невырождены. Этот метод является одной из разновидностей метода Гаусса.
- С помощью команды >> [LU]  = lu(A) я нашла матрицы L и U.
- Затем я нашла у, используя левое деление >> y =L\b
- Используя >> U\backslashbackslashy, я так же нахожу х через левое деление. (Рисунок 4).

![Рисунок 4: LU-разложение](images/image4.png)

## 4.4.4. LUP-разложение

4. Я задала LUP-разложение с помощью команды [L U P] = lu (A). (Рисунок 5).

![Рисунок 5: LUP-разложение](images/image5.png)

# Вывод

В ходе выполнения лабораторной работы я приобрела практические навыки работы с системами линейных уравнений в Octave. 





