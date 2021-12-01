program Day1Part2;
uses
        SysUtils;

const F_NAME = 'input.txt';

var
        tfIn   : TextFile;
        input  : string;
        window : array[0..2] of string;

        largerValues        : integer;
        currentSum, lastSum : integer;

        lastSumValid    : boolean;
        isCurrentLarger : boolean;

{
Sliding window:
199 A
200 A B
208 A B C
210   B C D
200     C D E
207       D E F
240         E F G
269           F G H
300             G H
291               H
}

{ Shift the current window by 1 and add the new input. }
procedure HandleInput(input: string);
begin
        window[2] := window[1];
        window[1] := window[0];
        window[0] := input;
end;

procedure LogWindow();
begin
        Write('[0] = ' + window[0] + ', [1] = ' + window[1] + ', [2] = ' + window[2] + ' -> ');
end;

{ Sum up all the values in the current window. }
function SumWindow(): integer;
begin
        SumWindow := StrToInt(window[0]) + StrToInt(window[1]) + StrToInt(window[2]);
end;

begin
        Assign(tfIn, F_NAME);
        Reset(tfIn);

        largerValues := 0;
        lastSum := -1;
        repeat
                { Read line and handle input. }
                ReadLn(tfIn, input);
                HandleInput(input);

                { Is the window valid? }
                if not (window[0] = '') and not (window[1] = '') and not (window[2] = '') then
                begin
                        currentSum := SumWindow();
                        LogWindow();
                        WriteLn(' sum: ' + IntToStr(currentSum));

                        { Is the last sum valid? }
                        lastSumValid := not (lastSum = -1);
                        { Is the current sum larger than the last one? }
                        isCurrentLarger := currentSum > lastSum;

                        { If it is, update largerValues. }
                        if lastSumValid and isCurrentLarger then
                        begin
                                WriteLn('Sum ' + IntToStr(currentSum) + ' is larger than lastSum ' + IntToStr(lastSum));
                                largerValues := largerValues + 1;
                        end;

                        lastSum := currentSum;
                end;
        until Eof(tfIn);

        WriteLn('Larger values: ' + IntToStr(largerValues));

        Close(tfIn);
end.

