set server output on
declare 
    type itemNameArr is varray(5) of varchar2(15);
    type itemPriceArr is varray(5) of number(5);
    type itemQuantArr is varray(5) of number(2);
    itemCosts number(7);
    totalBill number(7);
    item itemNameArr;
    price itemPriceArr;
    quant itemQuantArr;
begin
    item:=itemNameArr('Cake','Muffin','Waffle','Chocolate','Pastry');
    price:=itemPriceArr(200,80,120,120,60);
    quant:=itemQuantArr(1,4,5,2,15);
    totalBill:=0;
    itemCosts:=0;
    dbms_output.put_line('Displaying the Bill');
    for i in 1..5 Loop
        itemCosts:=price(i)*quant(i);
        dbms_output.put_line('Item Name : ' || item(i) || '   Item Price : ' || price(i) || '   Item Quantity : '|| quant(i)|| '   Cost : '|| itemCosts);
        totalBill:=totalBill+itemCosts;
    end loop;
    dbms_output.put_line('Total Bill : ' || totalBill );
end;

