declare 
    type marksArr is varray(5) of number(3);
    marks marksArr;
    avrg number(5,2);
    function calTotal
    return number 
    is 
        total number(3);
    begin
            total:=0;
            for i in 1..5 Loop
                total:=total+marks(i);
            end loop;
            Return total;
    end;
begin
    marks := marksArr(90,89,78,96,83);
    avrg:= calTotal();
    avrg:= avrg/5;
    DBMS_OUTPUT.PUT_LINE('Average Marks : '|| avrg);
end;


  
