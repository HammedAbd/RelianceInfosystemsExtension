codeunit 70976577 REIAmountInWords
{
    var
        Units: array[20] of Text[10];
        Tens: array[10] of Text[10];
        Scales: array[11] of Text[15];

    procedure ConvertNumberToWords(Number: Decimal; IntegerUnit: Text[30]; FractionalUnit: Text[30]): Text
    var
        Words: Text;
        IntegerPart: Decimal;
        DecimalPart: Decimal;
    begin
        Units[1] := 'One';
        Units[2] := 'Two';
        Units[3] := 'Three';
        Units[4] := 'Four';
        Units[5] := 'Five';
        Units[6] := 'Six';
        Units[7] := 'Seven';
        Units[8] := 'Eight';
        Units[9] := 'Nine';
        Units[10] := 'Ten';
        Units[11] := 'Eleven';
        Units[12] := 'Twelve';
        Units[13] := 'Thirteen';
        Units[14] := 'Fourteen';
        Units[15] := 'Fifteen';
        Units[16] := 'Sixteen';
        Units[17] := 'Seventeen';
        Units[18] := 'Eighteen';
        Units[19] := 'Nineteen';
        Units[20] := '';

        Tens[2] := 'Twenty';
        Tens[3] := 'Thirty';
        Tens[4] := 'Forty';
        Tens[5] := 'Fifty';
        Tens[6] := 'Sixty';
        Tens[7] := 'Seventy';
        Tens[8] := 'Eighty';
        Tens[9] := 'Ninety';
        Tens[10] := '';

        Scales[1] := 'Thousand';
        Scales[2] := 'Million';
        Scales[3] := 'Billion';
        Scales[4] := 'Trillion';
        Scales[5] := 'Quadrillion';
        Scales[6] := 'Quintillion';
        Scales[7] := 'Sextillion';
        Scales[8] := 'Septillion';
        Scales[9] := 'Octillion';
        Scales[10] := 'Nonillion';
        Scales[11] := 'Decillion';

        if Number = 0 then
            exit('Zero ' + IntegerUnit);

        Number := Round(Number, 0.01, '>');

        IntegerPart := Round(Number, 1, '<');
        DecimalPart := Round((Number - IntegerPart) * 100);

        Words := ConvertIntegerToWords(IntegerPart);

        if DecimalPart > 0 then
            Words := Words + ' ' + IntegerUnit + ' and ' + ConvertIntegerToWords(DecimalPart) + ' ' + FractionalUnit
        else
            Words := Words + ' ' + IntegerUnit;

        exit(Words);
    end;

    local procedure ConvertIntegerToWords(Number: Decimal): Text
    begin
        if Number = 0 then
            exit('');

        if Number < 20 then
            exit(Units[Number]);

        if Number < 100 then
            exit(ConvertTensToWords(Number));

        if Number < 1000 then
            exit(ConvertHundredsToWords(Number));

        exit(ConvertLargeNumbersToWords(Number));
    end;

    local procedure ConvertTensToWords(Number: Decimal): Text
    begin
        If (Number mod 10) = 0 then
            exit(Tens[Number div 10] + ' ' + Units[20]) // units[20] will return empty text
        else
            exit(Tens[Number div 10] + ' ' + Units[Number mod 10]);
    end;

    local procedure ConvertHundredsToWords(Number: Decimal): Text
    var
        Words: Text;
    begin
        Words := Units[Number div 100] + ' Hundred';
        if Number mod 100 > 0 then
            Words := Words + ' and ' + ConvertIntegerToWords(Number mod 100);
        exit(Words);
    end;

    local procedure ConvertLargeNumbersToWords(Number: Decimal): Text
    var
        ScaleIndex: Integer;
        ScaleValue: Integer;
        ScaleWords: Text;
    begin
        ScaleIndex := 1;
        ScaleValue := 1000;

        while Number >= ScaleValue * 1000 do begin
            ScaleValue := ScaleValue * 1000;
            ScaleIndex := ScaleIndex + 1;
        end;

        ScaleWords := ConvertIntegerToWords(Number div ScaleValue) + ' ' + Scales[ScaleIndex];
        if Number mod ScaleValue > 0 then
            ScaleWords := ScaleWords + ', ' + ConvertIntegerToWords(Number mod ScaleValue);

        exit(ScaleWords);
    end;
}