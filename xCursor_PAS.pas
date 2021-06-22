unit xCursor_PAS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Nyx, Menus, ShellAPI, StdCtrls, ComCtrls;

type
  TformX = class(TForm)
    BG: TImage;
    Menu: TMainMenu;
    MenuFile: TMenuItem;
    SubChange: TMenuItem;
    OpenCursor: TOpenDialog;
    Popup: TPopupMenu;
    PopTheme: TMenuItem;
    ThemeOrange: TMenuItem;
    ThemeRainbow: TMenuItem;
    ThemeCool: TMenuItem;
    ThemeMarbles: TMenuItem;
    ThemeBlue: TMenuItem;
    SubPlanet: TMenuItem;
    ThemeRay: TMenuItem;
    ThemeRainbowish: TMenuItem;
    ThemePlanets: TMenuItem;
    ThemeBlueRed: TMenuItem;
    ThemeHigh: TMenuItem;
    ThemeWhirl: TMenuItem;
    ThemeMachine: TMenuItem;
    SubOpen: TMenuItem;
    SubExit: TMenuItem;
    SubApply: TMenuItem;
    ImgDrop: TImage;
    MenuConfig: TMenuItem;
    SubDrop: TMenuItem;
    SubDropPre: TMenuItem;
    SubDropApply: TMenuItem;
    LabelAbove: TLabel;
    SubLanguage: TMenuItem;
    SubEnglish: TMenuItem;
    SubSrpski: TMenuItem;
    MenuSearch: TMenuItem;
    SubGoogle: TMenuItem;
    SubTFC: TMenuItem;
    SubMySpace: TMenuItem;
    Sub4U: TMenuItem;
    SubRestart: TMenuItem;
    MenuExtras: TMenuItem;
    SubSonar: TMenuItem;
    SubMSOn: TMenuItem;
    SubReverse: TMenuItem;
    SubRMBOn: TMenuItem;
    SubRMBOff: TMenuItem;
    SubMSOff: TMenuItem;
    Status: TStatusBar;
    Timer: TTimer;
    SubClickLock: TMenuItem;
    SubMCLOn: TMenuItem;
    SubMCLOff: TMenuItem;
    SubxCur: TMenuItem;
    MenuAbout: TMenuItem;
    SubAuthor: TMenuItem;
    SubHelp: TMenuItem;
    SubWeb: TMenuItem;
    SubRestore: TMenuItem;
    SubRestoreAll: TMenuItem;
    SubRestoreSingle: TMenuItem;
    SubArrow: TMenuItem;
    SubBG: TMenuItem;
    SubPreSelect: TMenuItem;
    SubHelpCur: TMenuItem;
    SubTextSel: TMenuItem;
    SubUn: TMenuItem;
    SubHandwriting: TMenuItem;
    SubMove: TMenuItem;
    SubDiag1: TMenuItem;
    SubDiag2: TMenuItem;
    SubVert: TMenuItem;
    SubHorz: TMenuItem;
    SubAltSel: TMenuItem;
    SubWait: TMenuItem;
    SubHand: TMenuItem;
    SubGenerate: TMenuItem;
    SubGenSingle: TMenuItem;
    SubGenMulti: TMenuItem;
    Line1: TMenuItem;
    Line3: TMenuItem;
    Line2: TMenuItem;
    Line4: TMenuItem;
    Line5: TMenuItem;
    Save: TSaveDialog;
    SubSAC: TMenuItem;
    SubSACOn: TMenuItem;
    SubSACOff: TMenuItem;
    SubConMenu: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure SubChangeClick(Sender: TObject);
    procedure applyTheme(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SubOpenClick(Sender: TObject);
    procedure SubExitClick(Sender: TObject);
    procedure SubApplyClick(Sender: TObject);
    procedure ImgDropMouseLeave(Sender: TObject);
    procedure SubDropPreClick(Sender: TObject);
    procedure SubDropApplyClick(Sender: TObject);
    procedure SubEnglishClick(Sender: TObject);
    procedure SubSrpskiClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SubGoogleClick(Sender: TObject);
    procedure SubTFCClick(Sender: TObject);
    procedure SubMySpaceClick(Sender: TObject);
    procedure Sub4UClick(Sender: TObject);
    procedure MenuFileClick(Sender: TObject);
    procedure SubRestartClick(Sender: TObject);
    procedure MenuExtrasClick(Sender: TObject);
    procedure SubMSOnClick(Sender: TObject);
    procedure SubRMBOnClick(Sender: TObject);
    procedure SubRMBOffClick(Sender: TObject);
    procedure SubMSOffClick(Sender: TObject);
    procedure SubSonarClick(Sender: TObject);
    procedure SubReverseClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure SubMCLOnClick(Sender: TObject);
    procedure SubMCLOffClick(Sender: TObject);
    procedure SubClickLockClick(Sender: TObject);
    procedure SubxCurClick(Sender: TObject);
    procedure SubWebClick(Sender: TObject);
    procedure SubAuthorClick(Sender: TObject);
    procedure SubRestoreAllClick(Sender: TObject);
    procedure SubGenSingleClick(Sender: TObject);
    procedure SubGenMultiClick(Sender: TObject);
    procedure SubSACClick(Sender: TObject);
    procedure SubSACOnClick(Sender: TObject);
    procedure SubSACOffClick(Sender: TObject);
    procedure SubConMenuClick(Sender: TObject);
  private
  procedure checkAll(Sender: TObject);
  procedure DropFile(Var Msg: TWMDropFiles); message WM_DROPFILES;
  procedure Translate(Lang: UnicodeString);
  procedure restoreCursor(Sender: TObject);
  public
    { Public declarations }
  end;

var
  formX: TformX;
  AppPath, ActiveLanguage: UnicodeString;
  LanguagePack: TStringList;
  sParam: Boolean;
implementation

{$R *.dfm}

{$LOCALSYMBOLS OFF}
{$IFOPT D-}{$WEAKLINKRTTI ON}{$ENDIF}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}

procedure TformX.DropFile(var Msg: TWMDropFiles);
const CursorPreview=1;
Var FileName: Array[0..260] Of Char;
begin
DragQueryFile(Msg.Drop, 0, FileName, 255);
If (LowerCase(GetExt(FileName))='cur') Or (LowerCase(GetExt(FileName))='ani') Or (LowerCase(GetExt(FileName))='xcur') Then
begin
If LowerCase(GetExt(FileName))='xcur' Then
  ImgDrop.Picture.Graphic:=loadResImg('DropOver', 'png')
Else
 ImgDrop.Picture.Graphic:=loadResImg('DropYes', 'png');
If IniRead(AppPath+'config.db', 'Config', 'Action')='preview' Then
begin
  Screen.Cursors[CursorPreview]:=LoadCursorFromFile(FileName);
  Self.Cursor:=CursorPreview;
  SubApply.Enabled:=True;
end
  Else
SetCursor(FileName);
DragFinish(Msg.Drop);
end
Else
ImgDrop.Picture.Graphic:=loadResImg('DropNot', 'png');
  end;

procedure TformX.TimerTimer(Sender: TObject);
begin
Status.SimpleText:='';
Timer.Enabled:=False;
end;

procedure TformX.Translate(Lang: UnicodeString);
begin
If Assigned(LanguagePack) Then
begin
If Lang='sr' Then
begin
 LanguagePack.LoadFromStream(loadFromRes('srb'), TEncoding.UTF8);
 IniWrite(AppPath+'config.db', 'Config', 'Lang', '0x0032');
 SubSrpski.Checked:=True;
 SubEnglish.Checked:=False;
end
Else
begin
  LanguagePack.LoadFromStream(loadFromRes('eng'));
  IniWrite(AppPath+'config.db', 'Config', 'Lang', '0x0064');
  SubEnglish.Checked:=True;
  SubSrpski.Checked:=False;
end;

 {  * The Translation Part. This Is A Tough One! :) *  }

 MenuFile.Caption:=LanguagePack.Strings[0];
 MenuConfig.Caption:=LanguagePack.Strings[1];
 MenuSearch.Caption:=LanguagePack.Strings[2];
 SubOpen.Caption:=LanguagePack.Strings[3];
 SubChange.Caption:=LanguagePack.Strings[4];
 SubApply.Caption:=LanguagePack.Strings[5];
 SubExit.Caption:=LanguagePack.Strings[6];
 SubLanguage.Caption:=LanguagePack.Strings[7];
 SubDrop.Caption:=LanguagePack.Strings[8];
 SubDropPre.Caption:=LanguagePack.Strings[9];
 SubDropApply.Caption:=LanguagePack.Strings[10];
 LabelAbove.Caption:=LanguagePack.Strings[11];
 OpenCursor.Filter:=LanguagePack.Strings[12];
 OpenCursor.Title:=LanguagePack.Strings[13];
 SubRestart.Caption:=LanguagePack.Strings[14];
 MenuExtras.Caption:=LanguagePack.Strings[15];
 SubSonar.Caption:=LanguagePack.Strings[16];
 SubReverse.Caption:=LanguagePack.Strings[17];
 SubClickLock.Caption:=LanguagePack.Strings[18];
 SubMSOn.Caption:=LanguagePack.Strings[19];
 SubRMBOn.Caption:=LanguagePack.Strings[19];
 SubMCLOn.Caption:=LanguagePack.Strings[19];
 SubMSOff.Caption:=LanguagePack.Strings[20];
 SubRMBOff.Caption:=LanguagePack.Strings[20];
 SubMSOff.Caption:=LanguagePack.Strings[20];
 SubMCLOff.Caption:=LanguagePack.Strings[20];
 SubSonar.Hint:=LanguagePack.Strings[21];
 SubReverse.Hint:=LanguagePack.Strings[17];
 SubClickLock.Hint:=LanguagePack.Strings[22];
 SubxCur.Caption:=LanguagePack.Strings[23];
 MenuAbout.Caption:=LanguagePack.Strings[24];
 SubHelp.Caption:=LanguagePack.Strings[25];
 SubAuthor.Caption:=LanguagePack.Strings[26];
 SubWeb.Caption:=LanguagePack.Strings[27];
 SubRestore.Caption:=LanguagePack.Strings[31];
 SubRestoreAll.Caption:=LanguagePack.Strings[32];
 SubRestoreSingle.Caption:=LanguagePack.Strings[33];
 SubArrow.Caption:=LanguagePack.Strings[34];
 SubBG.Caption:=LanguagePack.Strings[35];
 SubPreSelect.Caption:=LanguagePack.Strings[36];
 SubHelpCur.Caption:=LanguagePack.Strings[37];
 SubTextSel.Caption:=LanguagePack.Strings[38];
 SubUn.Caption:=LanguagePack.Strings[39];
 SubHandwriting.Caption:=LanguagePack.Strings[40];
 SubMove.Caption:=LanguagePack.Strings[41];
 SubDiag2.Caption:=LanguagePack.Strings[42];
 SubVert.Caption:=LanguagePack.Strings[43];
 SubDiag1.Caption:=LanguagePack.Strings[44];
 SubHorz.Caption:=LanguagePack.Strings[45];
 SubAltSel.Caption:=LanguagePack.Strings[46];
 SubWait.Caption:=LanguagePack.Strings[47];
 SubHand.Caption:=LanguagePack.Strings[48];
 SubGenerate.Caption:=LanguagePack.Strings[49];
 SubGenSingle.Caption:=LanguagePack.Strings[50];
 SubGenMulti.Caption:=LanguagePack.Strings[51];
 Save.Filter:='xCursor '+LanguagePack.Strings[0]+' (*.xcur)|*.xcur';
 SubSAC.Caption:=LanguagePack.Strings[52];
 SubSACOn.Caption:=LanguagePack.Strings[19];
 SubSACOff.Caption:=LanguagePack.Strings[20];
 SubSAC.Hint:=LanguagePack.Strings[53];
 SubConMenu.Caption:=LanguagePack.Strings[55];

end;
  end;

procedure ParseXCUR(FileName: UnicodeString);
Var I:  Byte;
begin
If IniRead(FileName, 'xCursor', 'Cursor', '@MULTI')='@MULTI' Then
begin
 For I:=0 To 14 Do
begin
If IniRead(FileName, 'xCursor', 'Cursor'+IntToStr(I), '')<>'' Then
begin
If FileExists(IniRead(FileName, 'xCursor', 'Cursor'+IntToStr(I), '')) Then
  SetCursor(IniRead(FileName, 'xCursor', 'Cursor'+IntToStr(I), ''), I);
end;
end;
end
  Else
begin
If FileExists(IniRead(FileName, 'xCursor', 'Cursor', '')) Then
  SetCursor(IniRead(FileName, 'xCursor', 'Cursor', ''));
end;
  end;

procedure TformX.Sub4UClick(Sender: TObject);
begin
openURL('http://www.cursors-4u.com/');
end;

procedure TformX.restoreCursor(Sender: TObject);
begin
SetCursor('0x000011', SubRestoreSingle.IndexOf((Sender As TMenuItem)));
end;

procedure TformX.SubApplyClick(Sender: TObject);
begin
If IniRead(AppPath+'config.db', 'Config', 'xSAC')='65536' Then
begin
CopyFile(PWideChar(OpenCursor.FileName), PWideChar(GetPath('cursors')+'\'+ExtractFileName(OpenCursor.FileName)), True);
OpenCursor.FileName:=GetPath('cursors')+'\'+ExtractFileName(OpenCursor.FileName);
end;
SetCursor(OpenCursor.FileName);
Self.Cursor:=crArrow;
SubApply.Enabled:=False;
end;

procedure TformX.SubAuthorClick(Sender: TObject);
begin
MessageDlg(LanguagePack.Strings[28]+' Igor Dimitrijević - SkyFlyer'+#13#10+LanguagePack.Strings[29], mtInformation, [mbOK], 0);
end;

procedure TformX.SubChangeClick(Sender: TObject);
begin
If OpenCursor.Execute Then
begin
If IniRead(AppPath+'config.db', 'Config', 'xSAC')='65536' Then
begin
CopyFile(PWideChar(OpenCursor.FileName), PWideChar(GetPath('cursors')+'\'+ExtractFileName(OpenCursor.FileName)), True);
OpenCursor.FileName:=GetPath('cursors')+'\'+ExtractFileName(OpenCursor.FileName);
end;
SetCursor(OpenCursor.FileName);
  SubApply.Enabled:=False;
  Self.Cursor:=crArrow;
end;
  end;

procedure TformX.SubClickLockClick(Sender: TObject);
begin
Status.SimpleText:='';
Status.SimpleText:=SubClickLock.Hint;
Timer.Enabled:=True;
end;

procedure TformX.SubConMenuClick(Sender: TObject);
begin
ContextMenu('.xcur', LanguagePack.Strings[54], Application.ExeName);
end;

procedure TformX.SubDropApplyClick(Sender: TObject);
begin
IniWrite(AppPath+'config.db', 'Config', 'Action', 'apply');
end;

procedure TformX.SubDropPreClick(Sender: TObject);
begin
 IniWrite(AppPath+'config.db', 'Config', 'Action', 'preview');
end;

procedure TformX.SubEnglishClick(Sender: TObject);
begin
Translate('en');
end;

procedure TformX.SubExitClick(Sender: TObject);
begin
Close;
end;

procedure TformX.SubGenMultiClick(Sender: TObject);
Var I: Byte;
begin
If Save.Execute Then
begin
For I:=0 To 14 Do
begin
If OpenCursor.Execute Then
  IniWrite(Save.FileName+'.xcur', 'xCursor', 'Cursor'+IntToStr(I), OpenCursor.FileName)
Else
  IniWrite(Save.FileName+'.xcur', 'xCursor', 'Cursor'+IntToStr(I), '');
end;
  end;
    end;

procedure TformX.SubGenSingleClick(Sender: TObject);
begin
If Save.Execute Then
begin
If OpenCursor.Execute Then
  IniWrite(Save.FileName+'.xcur', 'xCursor', 'Cursor', OpenCursor.FileName);
end;
end;

procedure TformX.SubGoogleClick(Sender: TObject);
begin
openURL('https://google.com');
end;

procedure TformX.SubMCLOffClick(Sender: TObject);
begin
SystemParametersInfo(SPI_SETMOUSECLICKLOCK, 0, Nil, 0);
SubMCLOn.Checked:=False;
end;

procedure TformX.SubMCLOnClick(Sender: TObject);
begin
sParam:=True;
SystemParametersInfo(SPI_SETMOUSECLICKLOCK, 0, @sParam, 0);
SubMCLOff.Checked:=False;
end;

procedure TformX.SubMSOffClick(Sender: TObject);
begin
SystemParametersInfo(SPI_SETMOUSESONAR, 0, Nil, 0);
SubMSOn.Checked:=False;
end;

procedure TformX.SubMSOnClick(Sender: TObject);
begin
sParam:=True;
SystemParametersInfo(SPI_SETMOUSESONAR, 0, @sParam, 0);
SubMSOn.Checked:=False;
end;

procedure TformX.SubMySpaceClick(Sender: TObject);
begin
openURL('http://www.myspacecursor.net/');
end;

procedure TformX.FormCreate(Sender: TObject);
Var Results: TSearchRec;
begin
formX.Icon:=Application.Icon;
AppPath:=ExtractFileDir(ParamStr(0))+'\';
DragAcceptFiles(Handle, True);
LanguagePack:=TStringList.Create;

If IniRead(AppPath+'config.db', 'Config', 'Lang', '0x0064')='0x0032' Then
  Translate('sr');

If IniRead(AppPath+'config.db', 'Config', 'Lang')='0x0032' Then
begin
  SubSrpski.Checked:=True;
  SubEnglish.Checked:=False;
end
  Else
begin
  SubSrpski.Checked:=False;
  SubEnglish.Checked:=True;
end;

If IniRead(AppPath+'config.db', 'Config', 'Action')='preview' Then
begin
  SubDropPre.Checked:=True;
  SubDropApply.Checked:=False;
end
  Else
begin
  SubDropPre.Checked:=False;
  SubDropApply.Checked:=True;
end;

If IniRead(AppPath+'config.db', 'Config', 'xSAC')='65536' Then
begin
  SubSACOn.Checked:=True;
  SubSACOff.Checked:=False;
end
  Else
begin
  SubSACOn.Checked:=False;
  SubSACOff.Checked:=True;
end;

If Not(DirectoryExists(AppPath+'Cursors')) Then
begin
  CreateDir(AppPath+'Cursors');
If FindFirst(AppPath+'Cursors\*.cur', faAnyFile, Results)<>0 Then
begin
  ExtractRes('Cursor_1', AppPath+'Cursors\Space.cur');
  ExtractRes('Cursor_2', AppPath+'Cursors\Blue Fire.ani');
  ExtractRes('Cursor_3', AppPath+'Cursors\Electricity.ani');
  ExtractRes('Cursor_4', AppPath+'Cursors\Blue.cur');
  ExtractRes('Cursor_5', AppPath+'Cursors\Bullseye.ani');
  ExtractRes('Cursor_6', AppPath+'Cursors\Cool.ani');
  ExtractRes('Cursor_7', AppPath+'Cursors\Game.ani');
  ExtractRes('Cursor_8', AppPath+'Cursors\Cool Game.ani');
end
  Else
FindClose(Results);
end;

If LowerCase(GetExt(ParamStr(1)))='xcur' Then
  ParseXCur(ParamStr(1));
    end;

procedure TformX.FormDestroy(Sender: TObject);
begin
LanguagePack.Free;
end;

procedure TformX.FormShow(Sender: TObject);
Var I: Integer;
begin
For I:=0 To SubRestoreSingle.Count-1 Do
  SubRestoreSingle.Items[I].OnClick:=restoreCursor;

IniWrite(AppPath+'config.db', 'Config', 'Created', 'true');
If IniRead(AppPath+'config.db', 'Config', 'Image')<>'' Then
begin
  BG.Picture.Graphic:=loadResImg('JpgImage_'+IniRead(AppPath+'config.db', 'Config', 'Image'));
end;
For I:=0 To Popup.Items[0].Count-1 Do
begin
Popup.Items[0][I].OnClick:=applyTheme;
Popup.Items[0][I].ShortCut:=ShortCut(65+I, [ssAlt]);
end;
ImgDrop.Picture.Graphic:=loadResImg('Drop', 'png');
end;

procedure TformX.ImgDropMouseLeave(Sender: TObject);
begin
ImgDrop.Picture.Graphic:=loadResImg('Drop', 'png');
end;

procedure TformX.MenuExtrasClick(Sender: TObject);
Var TestState: Boolean;
begin
SystemParametersInfo(SPI_GETMOUSESONAR, 0, @TestState, 0);
If TestState Then
begin
  SubMSOn.Checked:=True;
  SubMSOff.Checked:=False;
end
Else
begin
  SubMSOn.Checked:=False;
  SubMSOff.Checked:=True;
end;

If GetSystemMetrics(SM_SWAPBUTTON)<>0 Then
begin
  SubRMBOn.Checked:=True;
  SubRMBOff.Checked:=False;
end
Else
begin
  SubRMBOn.Checked:=False;
  SubRMBOff.Checked:=True;
end;

SystemParametersInfo(SPI_GETMOUSECLICKLOCK, 0, @TestState, 0);
If TestState Then
begin
  SubMCLOn.Checked:=True;
  SubMCLOff.Checked:=False;
end
Else
begin
  SubMCLOn.Checked:=False;
  SubMCLOff.Checked:=True;
end

end;

procedure TformX.MenuFileClick(Sender: TObject);
begin
If DirectoryExists(AppPath+'Cursors') Then
begin
  OpenCursor.InitialDir:=AppPath+'Cursors';
  OpenCursor.FilterIndex:=3;
end;
end;

procedure TformX.SubOpenClick(Sender: TObject);
const CursorPreview=1;
begin
If OpenCursor.Execute Then
begin
  Screen.Cursors[CursorPreview]:=LoadCursorFromFile(PWideChar(OpenCursor.FileName));
  Self.Cursor:=CursorPreview;
  SubApply.Enabled:=True;
end;
  end;

procedure TformX.SubRestartClick(Sender: TObject);
begin
ShellExecute(Handle, 'open', PWideChar(Application.ExeName), Nil, Nil, SW_SHOWNORMAL);
Close;
end;

procedure TformX.SubRestoreAllClick(Sender: TObject);
Var I: Byte;
begin
For I:=0 To 14 Do
  SetCursor('0x000011', I);
end;

procedure TformX.SubReverseClick(Sender: TObject);
begin
Status.SimpleText:='';
Status.SimpleText:=SubReverse.Hint;
Timer.Enabled:=True;
end;

procedure TformX.SubRMBOffClick(Sender: TObject);
begin
sParam:=False;
SystemParametersInfo(SPI_SETMOUSEBUTTONSWAP, 0, Nil, 0);
SubRMBOn.Checked:=False;
end;

procedure TformX.SubRMBOnClick(Sender: TObject);
begin
sParam:=True;
SystemParametersInfo(SPI_SETMOUSEBUTTONSWAP, 1, @sParam, 0);
SubRMBOff.Checked:=False;
end;

procedure TformX.SubSACClick(Sender: TObject);
begin
Status.SimpleText:='';
Status.SimpleText:=SubSAC.Hint;
Timer.Enabled:=True;
end;

procedure TformX.SubSACOffClick(Sender: TObject);
begin
IniWrite(AppPath+'config.db', 'Config', 'xSAC', '262144');
SubSACOn.Checked:=False;
SubSACOff.Checked:=true;
end;

procedure TformX.SubSACOnClick(Sender: TObject);
begin
IniWrite(AppPath+'config.db', 'Config', 'xSAC', '65536');
SubSACOn.Checked:=True;
SubSACOff.Checked:=False;
end;

procedure TformX.SubSonarClick(Sender: TObject);
begin
Status.SimpleText:='';
Status.SimpleText:=SubSonar.Hint;
Timer.Enabled:=True;
end;

procedure TformX.SubSrpskiClick(Sender: TObject);
begin
Translate('sr');
end;

procedure TformX.SubTFCClick(Sender: TObject);
begin

end;

procedure TformX.SubWebClick(Sender: TObject);
begin

end;

procedure TformX.SubxCurClick(Sender: TObject);
begin
Associate('xcur', Application.ExeName, Application.ExeName, 'xCursor '+LanguagePack.Strings[0], '"%1"', False, 0);
Status.SimpleText:=LanguagePack.Strings[30];
Timer.Enabled:=True;
end;

procedure TformX.applyTheme(Sender: TObject);
begin
BG.Picture.Graphic:=loadResImg('JpgImage_'+IntToStr(Popup.Items[0].IndexOf((Sender As TMenuItem))+1));
IniWrite(AppPath+'config.db', 'Config', 'Image', IntToStr(Popup.Items[0].IndexOf((Sender As TMenuItem))+1));
checkAll(Sender);
end;

procedure TformX.checkAll(Sender: TObject);
Var I: Byte;
begin
 For I:=0 To Popup.Items[0].Count-1 Do
begin
If Popup.Items[0].IndexOf((Sender As TMenuItem))<>I Then
  Popup.Items[0][I].Checked:=False
Else
  Popup.Items[0][I].Checked:=True;
end;
  end;

end.
