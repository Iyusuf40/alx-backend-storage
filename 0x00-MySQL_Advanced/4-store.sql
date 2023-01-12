-- script creates a trigger that decreases the quantity of an item after adding a new order.
-- drop trigger before creation

DROP TRIGGER IF EXISTS reduce_qty;

CREATE TRIGGER reduce_qty
AFTER INSERT
ON orders FOR EACH ROW
UPDATE items
SET quantity = quantity - NEW.number
WHERE NEW.item_name = name;
