unit swPHPSerializer;

interface

uses sysutils, math;

type
  TPHPSerializer = class
  private const
    _BRACKET_OPEN = '{';
    _BRACKET_CLOSE = '}';
    _DATA_DELIMITER = ';';

  var
    _result_string: string;

  public
    constructor Create;
    procedure Clear(dummy: boolean = true);
    procedure CreateClass(class_name: string; num_class_members: integer);
    procedure CloseClass;
    procedure ArrayStart(array_len: integer);
    procedure AddBoolean(b: boolean);
    procedure AddInt(int: integer);
    procedure AddFloat(f: double);
    procedure AddString(str: string);

    procedure AddDepthLevel;
    procedure CloseDepthLevel;

    Procedure AddField(field_name: string);

    procedure Add(b: boolean); overload;
    procedure Add(int: integer); overload;
    procedure Add(f: double); overload;
    procedure Add(str: string); overload;

    function GetFinalSWON: string;

  end;

implementation

{ TswONBuilder }

procedure TPHPSerializer.Add(int: integer);
begin
  self.AddInt(int);
end;

procedure TPHPSerializer.Add(b: boolean);
begin
  self.AddBoolean(b);
end;

procedure TPHPSerializer.Add(str: string);
begin
  self.AddString(str);
end;

procedure TPHPSerializer.Add(f: double);
begin
  self.AddFloat(f);
end;

procedure TPHPSerializer.AddBoolean(b: boolean);
begin
  self._result_string := self._result_string + 'b:' + BoolToStr(b, false) + self._DATA_DELIMITER;
end;

procedure TPHPSerializer.AddDepthLevel;
begin

end;

procedure TPHPSerializer.AddField(field_name: string);
begin
  self._result_string := self._result_string + 's:' + inttostr(field_name.Length) + ':"' + field_name + '"' + self._DATA_DELIMITER;
end;

procedure TPHPSerializer.AddFloat(f: double);
begin
  self._result_string := self._result_string + 'd:' + floattostr(RoundTo(f, -4)) + self._DATA_DELIMITER;
end;

procedure TPHPSerializer.AddInt(int: integer);
begin
  self._result_string := self._result_string + 'i:' + inttostr(int) + self._DATA_DELIMITER;
end;

procedure TPHPSerializer.AddString(str: string);
begin
  self._result_string := self._result_string + 's:' + inttostr(str.Length) + ':"' + str + '"' + self._DATA_DELIMITER;
end;

procedure TPHPSerializer.ArrayStart(array_len: integer);
begin
  self._result_string := self._result_string + 'a:' + inttostr(array_len) + ':{';
end;

procedure TPHPSerializer.Clear(dummy: boolean = true);
begin
  self._result_string := '';
end;

procedure TPHPSerializer.CloseClass;
begin
  // force close remaining brackets
  self._result_string := self._result_string + self._BRACKET_CLOSE;
end;

procedure TPHPSerializer.CloseDepthLevel;
begin

end;

constructor TPHPSerializer.Create;
begin
  self.Clear;
end;

procedure TPHPSerializer.CreateClass(class_name: string; num_class_members: integer);
begin
  self._result_string := self._result_string + 'O:' + inttostr(Length(class_name)) + ':"' + class_name + '":' + inttostr(num_class_members) + ':{';
end;

function TPHPSerializer.GetFinalSWON: string;
begin

  Result := self._result_string;
end;

end.
