program xCursor;



{$R *.dres}

uses
  Forms,
  Nyx,
  Windows,
  Messages,
  xCursor_PAS in 'xCursor_PAS.pas' {formX};

{$R *.res}

begin
If GetWin('xCursor :)')=0 Then
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'xCursor :)';
  ReportMemoryLeaksOnShutdown:=DebugHook<>0;
  Application.CreateForm(TformX, formX);
  Application.Run;
end
  Else
begin
ShowWindow(GetWin('xCursor :)'), SW_SHOW);
SetFocus(getWin('xCursor :)'));
end;
end.
