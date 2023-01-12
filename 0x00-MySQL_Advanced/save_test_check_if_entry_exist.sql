delimiter // 

DROP PROCEDURE IF EXISTS test //

CREATE PROCEDURE test(INOUT k INT)
begin
    -- check if there is 'apple' entry in items table
    SELECT count(*) into @v FROM items where name = 'apple';
    if @v >= 1 
    then 
        SELECT count(*) into k FROM items;
        set @k = 4;
    end if; 
end // 

-- SET @y = 0//
CALL test(@y) //
CALL test(@o)//

select @y//
select @k//
select @o//

delimiter ;
