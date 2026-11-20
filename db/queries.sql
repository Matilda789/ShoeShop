-- авторизация пользователя
SELECT u.id, u.second_name, u.first_name, u.last_name, r.name AS role
FROM users u
JOIN roles r ON r.id = u.role
WHERE u.login = ? AND u.password = ?;

-- каталог товаров
SELECT p.id, p.article, pt.name as name, p.unit, p.price, p.discount, p.stock_quantity,
p.description, p.photo,
c.name AS category, m.name AS manufacturer, s.name AS supplier
FROM products p
JOIN categories c ON c.id = p.category_id
JOIN manufacturers m ON m.id = p.manufacturer_id
JOIN suppliers s ON s.id = p.supplier_id
JOIN product_types pt ON pt.id = p.type_id;

-- c поиском, фильтром и сортировкой
SELECT p.id, p.article, pt.name as name, p.unit, p.price, p.discount, p.stock_quantity,
p.description, p.photo,
c.name AS category, m.name AS manufacturer, s.name AS supplier
FROM products p
JOIN categories c ON c.id = p.category_id
JOIN manufacturers m ON m.id = p.manufacturer_id
JOIN suppliers s ON s.id = p.supplier_id
JOIN product_types pt ON pt.id = p.type_id

WHERE pt.name LIKE CONCAT('%', ?, '%') AND p.supplier_id = ?
ORDER BY p.stock_quantity DESC;

-- справочники для выпадающих списков в форме
SELECT id, name FROM categories;
SELECT id, name FROM manufacturers;
SELECT id, name FROM suppliers;
-- добавление товара
INSERT INTO products
(article, type_id, unit, price, discount, stock_quantity, description, photo, category_id,
manufacturer_id, supplier_id)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
-- открыть товар для редактирования — заполнить все поля сразу
SELECT * FROM products WHERE id = ?;
-- сохранить изменения
UPDATE products
SET article=?, type_id=?, unit=?, price=?, discount=?, stock_quantity=?, description=?, photo=?,
category_id=?, manufacturer_id=?, supplier_id=?
WHERE id = ?;

-- проверка защиты от удаления купленного товара
SELECT COUNT(*) AS used_in_orders FROM prodorders WHERE product_id = ?;
DELETE FROM products WHERE id = ?;



