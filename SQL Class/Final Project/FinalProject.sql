DROP TABLE books_audit_table CASCADE CONSTRAINTS;
DROP TRIGGER books_update_trig;

CREATE TABLE books_audit_table
(
  ISBN VARCHAR2(10),
  title VARCHAR2(30),
  retail NUMBER(5, 2),
  cost NUMBER(5, 2),
  description VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER books_update_trig 
BEFORE
UPDATE OF retail, cost ON books
FOR EACH ROW
BEGIN
  IF UPDATING ('retail') THEN
    INSERT INTO books_audit_table(ISBN, title, retail, cost, description) VALUES(:OLD.ISBN, :OLD.title, :NEW.retail, :NEW.cost, 'Retail value changed');
  ELSIF UPDATING ('cost') THEN
    INSERT INTO books_audit_table(ISBN, title, retail, cost, description) VALUES(:OLD.ISBN, :OLD.title, :NEW.retail, :NEW.cost, 'Cost value changed');
  END IF;
END;
/

CREATE OR REPLACE FUNCTION avg_price
RETURN NUMBER
IS
  AP NUMBER := 0;
BEGIN
  SELECT AVG(retail) INTO AP FROM books;
  RETURN AP;
END AVG_PRICE;
/

CREATE OR REPLACE PROCEDURE update_retail_price(p_perRaise IN NUMBER)--In decimal form
IS
CURSOR c1 IS 
SELECT retail FROM books;
BEGIN
  OPEN c1;
    LOOP
      FETCH c1 INTO p_rval;
	  FOR val IN p_rval
	    UPDATE books SET retail = retail + (retail * p_perRaise) WHERE retail IN c1;
      EXIT WHEN c1%NOTFOUND;
	END LOOP;
  CLOSE c1;
END;
/
