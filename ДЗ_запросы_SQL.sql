-- Выведите авторов, имеющихся в базе
SELECT name
FROM author a 

-- Найдите всех авторов с инициалами "С. А.". Автор в базе определяется так: И. О. Фамилия
SELECT name
FROM author a 
WHERE name LIKE "С. А.%"

-- Выведите список книг, выпущенных в издательстве "Мир"
SELECT b.title, p.name
FROM book b
JOIN publisher p 
ON b.publisher_id  = p.id 
WHERE p.name LIKE  'Мир'

-- Выведите количество книг, принадлежащих каждой из категорий. Результат отсортировать по возрастанию
SELECT b.category_id, c.title, COUNT (b.title) as amount
FROM book b
LEFT JOIN category c 
ON b.category_id = c.id
GROUP BY b.category_id 
ORDER BY amount ASC

-- Выведите количество книг, выпущенных в каждом издательстве. 
-- В итоговом списке оставьте только те издательства, которые выпустили 3 и более книг. 
-- Результат отсортировать по убыванию

SELECT p.id, p.name, COUNT(b.title) as amount
FROM publisher p
LEFT JOIN book b
ON p.id = b.publisher_id
GROUP BY p.name
HAVING amount >=3

-- Выведите список книг, автором которых являлся <<С. А. Айвазян>>
SELECT a.book_id, b.title, a2.name
FROM authorbook a 
JOIN book b 
ON a.book_id = b.id
JOIN author a2
ON a.author_id = a2.id
WHERE a2.name LIKE 'С. А. Айвазян'

-- В каких издательствах и сколько выпускались книги за авторством <<С. А. Айвазян>>.
-- Результат отсортировать по убыванию
SELECT a.book_id, a2.name, p.name, COUNT(b.title) AS amount
FROM authorbook a 
JOIN book b 
ON a.book_id = b.id
JOIN publisher p 
ON b.publisher_id = p.id
JOIN author a2
ON a.author_id = a2.id
WHERE a2.name LIKE 'С. А. Айвазян'
GROUP BY p.name


  