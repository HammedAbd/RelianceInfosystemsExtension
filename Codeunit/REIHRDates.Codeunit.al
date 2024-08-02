codeunit 70976578 REIHRDates
{

    trigger OnRun()
    begin
    end;

    var
        dayofWeek: Integer;
        Year: Integer;
        NextDay: Date;
        TEXTDATE1Err: Label 'The Start date cannot be Greater then the end Date.';

    procedure DetermineAge(DateofBirth: Date;DateofJoin: Date) AgeString: Text[45]
    var
        dayB: Integer;
        monthB: Integer;
        yearB: Integer;
        dayJ: Integer;
        monthJ: Integer;
        yearJ: Integer;
        Month: Integer;
        Day: Integer;
        DateCat: Integer;
    begin
                  if ((DateofBirth <> 0D) and (DateofJoin <> 0D)) then begin
                    dayB := DATE2DMY(DateofBirth,1);
                    monthB := DATE2DMY(DateofBirth,2);
                    yearB := DATE2DMY(DateofBirth,3);
                    dayJ := DATE2DMY(DateofJoin,1);
                    monthJ := DATE2DMY(DateofJoin,2);
                    yearJ := DATE2DMY(DateofJoin,3);
                    Day := 0; Month := 0; Year := 0;
                    DateCat := DateCategory(dayB,dayJ,monthB,monthJ,yearB,yearJ);
                    case (DateCat) of
                        1: begin
                             Year := yearJ - yearB;
                             if monthJ >= monthB then
                                Month := monthJ - monthB
                             else begin
                                Month := (monthJ + 12) - monthB;
                                Year := Year - 1;
                             end;

                             if (dayJ >= dayB) then
                                Day := dayJ - dayB
                             else 
                                if (dayJ < dayB) then begin
                                Day := (DetermineDaysInMonth(monthJ,yearJ) + dayJ) - dayB;
                                Month := Month - 1;
                             end;

                                AgeString := '%1  Years, %2  Months and #3## Days';
                                AgeString := STRSUBSTNO(AgeString,Year,Month,Day);

                            end;

                        2,3,7:begin
                              if (monthJ <> monthB) then
                                   if monthJ >= monthB then
                                      Month := monthJ - monthB;

                             if (dayJ <> dayB) then 
                              if (dayJ >= dayB) then
                                Day := dayJ - dayB
                              else 
                              if (dayJ < dayB) then begin
                                Day := (DetermineDaysInMonth(monthJ,yearJ) + dayJ) - dayB;
                                Month := Month - 1;
                              end;

                               AgeString := '%1  Months %2 Days';
                               AgeString := STRSUBSTNO(AgeString,Month,Day);
                              end;
                         4: begin
                               Year := yearJ - yearB;
                               AgeString := '#1## Years';
                               AgeString := STRSUBSTNO(AgeString,Year);
                            end;
                         5: begin
                             if (dayJ >= dayB) then
                                Day := dayJ - dayB
                             else 
                                if (dayJ < dayB) then begin
                                    Day := (DetermineDaysInMonth(monthJ,yearJ) + dayJ) - dayB;
                                    monthJ := monthJ - 1;
                                    Month := (monthJ + 12) - monthB;
                                    yearJ := yearJ - 1;
                                end;

                             Year := yearJ - yearB;
                                AgeString := '%1  Years, %2 Months and #3## Days';
                                AgeString := STRSUBSTNO(AgeString,Year,Month,Day);
                             end;
                         6: begin
                             if monthJ >= monthB then
                                Month := monthJ - monthB
                             else begin
                                Month := (monthJ + 12) - monthB;
                                yearJ := yearJ - 1;
                             end;
                                Year := yearJ - yearB;
                                AgeString := '%1  Years and #2## Months';
                                AgeString := STRSUBSTNO(AgeString,Year,Month);
                            end;
                        else AgeString := '';
                        end;
                      end else MESSAGE('for Date Calculation Enter All Applicable Dates!');
                       exit;
    end;

    procedure DifferenceStartend(StartDate: Date;endDate: Date) DaysValue: Integer
    var
        AbsencePreferences: Record REIHRAbsencePreferences;
        dayStart: Integer;
        monthS: Integer;
        yearS: Integer;
        dayend: Integer;
        monthE: Integer;
        yearE: Integer;
        i: Integer;
        j: Integer;
        p: Integer;
        q: Integer;
        l: Integer;
        DateCat: Integer;
        daysInYears: Integer;
        m: Integer;
        yearStart: Integer;
        t: Integer;
        s: Integer;
        WeekendDays: Integer;
        Holidays: Integer;
    begin
                 if ((StartDate <> 0D) and (endDate <> 0D)) then begin
                //    Day := 0; monthValue := 0; p := 0; q := 0; l := 0;
                    Year := 0; daysInYears := 0; DaysValue := 0;
                    dayStart := DATE2DMY(StartDate,1);
                    monthS := DATE2DMY(StartDate,2);
                    yearS := DATE2DMY(StartDate,3);
                    dayend := DATE2DMY(endDate,1);
                    monthE := DATE2DMY(endDate,2);
                    yearE := DATE2DMY(endDate,3);

                    WeekendDays := 0;
                    AbsencePreferences.FIND('-');
                     if (AbsencePreferences."Include Weekends" = true) then
                       WeekendDays := DetermineWeekends(StartDate,endDate);

                    Holidays := 0;

                    //Add repeat until next 080124

                    if AbsencePreferences.FindSet() then
                        repeat
                    if (AbsencePreferences."Include Holidays" = true) then
                        Holidays := DetermineHolidays(StartDate,endDate);
                        until AbsencePreferences.Next() = 0;


                    DateCat := DateCategory(dayStart,dayend,monthS,monthE,yearS,yearE);
                    case (DateCat) of
                        1: begin
                            p := 0; q := 0;
                            Year := yearE - yearS;
                            yearStart := yearS;
                            t := 1; s := 1;
                            if (monthE <> monthS) then begin

                             for j := 1 to (monthS - 1) do begin
                                 q := q + DetermineDaysInMonth(t,yearS);
                                 t := t + 1;
                             end;
                                 q := q + dayStart;

                             for i := 1 to (monthE - 1) do begin
                                 p := p + DetermineDaysInMonth(s,yearE);
                                 s := s + 1;
                             end;
                                 p := p + dayend;

                             for m := 1 to Year do begin
                                if LeapYear(yearStart) then daysInYears := daysInYears + 366
                                else daysInYears := daysInYears + 365;
                                yearStart := yearStart + 1;
                             end;
                                DaysValue := (((daysInYears - q) + p) - WeekendDays) - Holidays;
                             end;
                           end;

                        2,7 : begin
                              for l := (monthS + 1) to (monthE - 1) do
                                  DaysValue := DaysValue + DetermineDaysInMonth(l,yearS);
                              DaysValue := ((DaysValue + (DetermineDaysInMonth(monthS,yearS) - dayStart) + dayend) - WeekendDays) - Holidays;
                              end;

                        3: 
                            if (dayend >= dayStart) then
                                DaysValue := dayend - dayStart - WeekendDays - Holidays
                            else 
                                if (dayend = dayStart) then DaysValue := 0
                            else DaysValue := ((dayStart - dayend) - WeekendDays) - Holidays;

                        4: begin
                            DaysValue := 0;
                            Year := yearE - yearS;
                            yearStart := yearS;
                            for m := 1 to Year do begin
                             if (LeapYear(yearStart)) then daysInYears := 366
                                 else daysInYears := 365;
                                 DaysValue := DaysValue + daysInYears;
                                 yearStart := yearStart + 1;
                            end;
                            DaysValue := (DaysValue - WeekendDays) - Holidays;
                            end;

                         5: begin
                            Year := yearE - yearS;
                            yearStart := yearS;
                             for m := 1 to Year do begin
                                if LeapYear(yearStart) then daysInYears := daysInYears + 366
                                else daysInYears := daysInYears + 365;
                                yearStart := yearStart + 1;
                             end;
                                DaysValue := daysInYears;
                              if dayend > dayStart then
                                DaysValue := (DaysValue + (dayend - dayStart) - WeekendDays) - Holidays
                              else 
                              if dayStart > dayend then
                                DaysValue := (DaysValue - (dayStart - dayend) - WeekendDays) - Holidays;
                            end;

                         6: begin
                            q := 0; p := 0;
                            Year := yearE - yearS;
                            yearStart := yearS;
                            t := 1; s := 1;

                             for j := 1 to monthS do begin
                                 q := q + DetermineDaysInMonth(t,yearS);
                                 t := t + 1;
                             end;

                             for i := 1 to monthE do begin
                                 p := p + DetermineDaysInMonth(s,yearE);
                                 s := s + 1;
                             end;

                             for m := 1 to Year do begin
                                if LeapYear(yearStart) then daysInYears := daysInYears + 366
                                else daysInYears := daysInYears + 365;
                                yearStart := yearStart + 1;
                             end;

                              DaysValue := ((daysInYears - q) + p) - WeekendDays - Holidays;
                             end;
                        else DaysValue := 0;

                    end;
                end else MESSAGE('Enter all applicable dates for calculation!');
                    DaysValue += 1;
                    exit;
    end;

    procedure DetermineDaysInMonth(Month: Integer; YearDDIM: Integer) DaysInMonth: Integer
    begin
        case (Month) of
            1 : DaysInMonth := 31;
            2 : 
                if (LeapYear(Year)) then DaysInMonth := 29
                    else DaysInMonth := 28;
                
            3 : DaysInMonth := 31;
            4 : DaysInMonth := 30;
            5 : DaysInMonth := 31;
            6 : DaysInMonth := 30;
            7 : DaysInMonth := 31;
            8 : DaysInMonth := 31;
            9 : DaysInMonth := 30;
            10 : DaysInMonth := 31;
            11 :   DaysInMonth := 30;
            12 :   DaysInMonth := 31;
                else MESSAGE('Not valid date. The month must be between 1 and 12');
        end;
            exit;
    end;

    procedure DateCategory(BDay: Integer;EDay: Integer;BMonth: Integer;EMonth: Integer;BYear: Integer;EYear: Integer) Category: Integer
    begin
        if ((EYear > BYear) and (EMonth <> BMonth) and (EDay <> BDay)) then Category := 1
            else 
        if ((EYear = BYear) and (EMonth <> BMonth) and (EDay = BDay)) then Category := 2
            else 
        if ((EYear = BYear) and (EMonth = BMonth) and (EDay <> BDay)) then Category := 3
            else 
        if ((EYear > BYear) and (EMonth = BMonth) and (EDay = BDay)) then Category := 4
            else 
        if ((EYear > BYear) and (EMonth = BMonth) and (EDay <> BDay)) then Category := 5
            else 
        if ((EYear > BYear) and (EMonth <> BMonth) and (EDay = BDay)) then Category := 6
            else 
        if ((EYear = BYear) and (EMonth <> BMonth) and (EDay <> BDay)) then Category := 7
            else 
        if ((EYear = BYear) and (EMonth = BMonth) and (EDay = BDay)) then Category := 3
            else 
        if ((EYear < BYear)) then
            error(TEXTDATE1Err)
            else
                Category := 0;
            exit;
    end;

    procedure LeapYear(YearLP: Integer) LY: Boolean
    var
        CenturyYear: Boolean;
        DivByFour: Boolean;
    begin
                           CenturyYear := Year mod 100 = 0;
                           DivByFour := Year mod 4 = 0;
                           if ((not CenturyYear and DivByFour) or (Year mod 400 = 0)) then
                            LY := true
                           else
                            LY := false;
    end;

    procedure ReservedDates(NewStartDate: Date;NewendDate: Date;EmployeeNumber: Code[20]) Reserved: Boolean
    var
        AbsenceHoliday: Record REIHRAbsenceHoliday;
    begin
                          AbsenceHoliday.SETFILTER("Employee No.",EmployeeNumber);
                          if AbsenceHoliday.FindSet() then
                          repeat
                              if (NewStartDate > AbsenceHoliday."Start Date") and (NewStartDate < AbsenceHoliday."end Date") then
                                 Reserved := true
                              else
                              if (NewendDate < AbsenceHoliday."end Date") and (NewendDate > AbsenceHoliday."Start Date") then
                                 Reserved := true
                              else
                              if (NewStartDate > AbsenceHoliday."Start Date") and (NewendDate < AbsenceHoliday."end Date") then
                                 Reserved := true
                              else Reserved := false;

                          until AbsenceHoliday.Next() = 0;
    end;

    procedure DetermineWeekends(DateStart: Date;Dateend: Date) Weekends: Integer
    begin
                 Weekends := 0;
                 while (DateStart <= Dateend) do begin
                   dayofWeek := DATE2DWY(DateStart,1);
                     if (dayofWeek = 6) or (dayofWeek = 7) then
                        Weekends := Weekends + 1;
                   NextDay := CalculateNextDay(DateStart);
                   DateStart := NextDay;
                 end;
    end;

    procedure CalculateNextDay(Date: Date) NextDate: Date
    var
        today: Integer;
        month: Integer;
        nextDayCND: Integer;
        daysInMonth: Integer;
    begin
                    today := DATE2DMY(Date,1);
                    month := DATE2DMY(Date,2);
                    year := DATE2DMY(Date,3);
                    daysInMonth := DetermineDaysInMonth(month,year);
                    nextDayCND := today + 1;
                    if (nextDayCND > daysInMonth) then begin
                      nextDayCND := 1;
                      month := month + 1;
                      if (month > 12) then begin
                        month := 1;
                        year := year + 1;
                      end;
                    end;
                     NextDate := DMY2DATE(nextDayCND,month,year);
    end;

    procedure DetermineHolidays(DateStart: Date;Dateend: Date) Holiday: Integer
    var
        StatutoryHoliday: Record REIHRNWDaysDates;
    begin
                  Holiday := 0;
                  while (DateStart <= Dateend) do begin
                    dayofWeek := DATE2DWY(DateStart,1);
                    StatutoryHoliday.FIND('-');
                    repeat
                     if (DateStart = StatutoryHoliday."Non Working Dates") then
                        Holiday := Holiday + StatutoryHoliday.Code;

                    until StatutoryHoliday.Next() = 0;
                    NextDay := CalculateNextDay(DateStart);
                    DateStart := NextDay;
                 end;
    end;

    procedure ConvertDate(nDate: Date) strDate: Text[30]
    var
        lDay: Integer;
        lMonth: Integer;
        lYear: Integer;
        strDay: Text[4];
        StrMonth: Text[20];
        strYear: Text[6];
    begin
        //this function converts the date to the format required by ksps
        lDay := DATE2DMY(nDate,1);
        lMonth := DATE2DMY(nDate,2);
        lYear := DATE2DMY(nDate,3);

        if lDay = 1 then strDay := '1st' ;
        if lDay = 2 then strDay := '2nd' ;
        if lDay = 3 then strDay := '3rd' ;
        if lDay = 4 then strDay := '4th' ;
        if lDay = 5 then strDay := '5th' ;
        if lDay = 6 then strDay := '6th' ;
        if lDay = 7 then strDay := '7th' ;
        if lDay = 8 then strDay := '8th' ;
        if lDay = 9 then strDay := '9th' ;
        if lDay = 10 then strDay := '10th' ;
        if lDay = 11 then strDay := '11th' ;
        if lDay = 12 then strDay := '12th' ;
        if lDay = 13 then strDay := '13th' ;
        if lDay = 14 then strDay := '14th' ;
        if lDay = 15 then strDay := '15th' ;
        if lDay = 16 then strDay := '16th' ;
        if lDay = 17 then strDay := '17th' ;
        if lDay = 18 then strDay := '18th' ;
        if lDay = 19 then strDay := '19th' ;
        if lDay = 20 then strDay := '20th' ;
        if lDay = 21 then strDay := '21st' ;
        if lDay = 22 then strDay := '22nd' ;
        if lDay = 23 then strDay := '23rd' ;
        if lDay = 24 then strDay := '24th' ;
        if lDay = 25 then strDay := '25th' ;
        if lDay = 26 then strDay := '26th' ;
        if lDay = 27 then strDay := '27th' ;
        if lDay = 28 then strDay := '28th' ;
        if lDay = 29 then strDay := '29th' ;
        if lDay = 30 then strDay := '30th' ;
        if lDay = 31 then strDay := '31st' ;
        if lMonth = 1 then StrMonth := ' January '; 
        if lMonth = 2 then StrMonth := ' February ' ;
        if lMonth = 3 then StrMonth := ' March ' ;
        if lMonth = 4 then StrMonth := ' April ' ;
        if lMonth = 5 then StrMonth := ' May ' ;
        if lMonth = 6 then StrMonth := ' June ' ;
        if lMonth = 7 then StrMonth := ' July ' ;
        if lMonth = 8 then StrMonth := ' August ' ;
        if lMonth = 9 then StrMonth := ' September ' ;
        if lMonth = 10 then StrMonth := ' October ' ;
        if lMonth = 11 then StrMonth := ' November ' ;
        if lMonth = 12 then StrMonth := ' December ' ;

        strYear := FORMAT(lYear);
        strDate := strDay + StrMonth + strYear;
    end;
}
