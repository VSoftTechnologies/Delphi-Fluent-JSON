program FluentJSONTest;

{$APPTYPE CONSOLE}

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  SysUtils,
  VSoft.Fluent.JSON in 'VSoft.Fluent.JSON.pas';

procedure DoTest;
var
  builder : IFluentJSONBuilder;
begin
  builder := TFluentJSON.CreateJSONBuilder;
  builder.AddObject()
    .AddString('name1','value1\sdfgsdf')
    .AddString('name2','value2')
    .AddNumber('name3',1234)
    .AddNumber('name3',1234.5678)
    .AddObject('child')
    .AddString('name4','value4')
    .AddNumber('name5',5678)
    .Up
    .AddString('Another','fgdfgdf')
    .AddArray('Array')
    .AddString('element1')
    .AddNumber(123456789);
  Writeln(builder.ToString);
  Readln;
end;

begin
  try
    DoTest;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
