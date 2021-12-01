program Day1;
uses
        SysUtils;

const
        F_NAME = 'input.txt';

var
        tfIn: TextFile;
        input, lastInput : string;

        largerValues: integer;
        parsedInt, lastParsedInt: integer;

procedure HandleInput(input: string);
begin
        parsedInt := StrToInt(input);
        lastParsedInt := StrToInt(lastInput);

        if parsedInt > lastParsedInt then
                largerValues := largerValues + 1;
end; { End of procedure HandleInput }

begin
        Assign(tfIn, F_NAME);
        Reset(tfIn);

        lastInput := '';
        repeat
                ReadLn(tfIn, input);
                if not (lastInput = '') and not (input = '') then
                        HandleInput(input);
                lastInput := input
        until Eof(tfIn);

        WriteLn('Larger values: ' + IntToStr(largerValues));

        Close(tfIn);
end.
