unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    PaintBox1: TPaintBox;
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);

    procedure PaintBox1Click(Sender: TObject);

    procedure FormResize(Sender: TObject);

    procedure MenuItem1Click(Sender: TObject);

    procedure MenuItem2Click(Sender: TObject);

    procedure MenuItem3Click(Sender: TObject);

    procedure MenuItem4Click(Sender: TObject);

    procedure MenuItem5Click(Sender: TObject);

  private

  public
    task: Integer;
  end;


var
  Form1: TForm1;
var x: integer = -1;
var y: integer = -1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.MenuItem1Click(Sender: TObject);
begin


  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(0, 0, Form1.ClientWidth, Form1.ClientHeight);
  PaintBox1.Canvas.Pen.Width := 10;
  PaintBox1.Canvas.Pen.Color := clRed;
  PaintBox1.Canvas.Line(20, 20, 20, 20);
end;


procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(0, 0, Form1.ClientWidth, Form1.ClientHeight);
  PaintBox1.Canvas.Pen.Width := 10;

  PaintBox1.Canvas.Pen.Color := RGBToColor(Random(256), Random(256), Random(256));
  PaintBox1.Canvas.Line(20, 20, 20, 20);
end;


procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(0, 0, Form1.ClientWidth, Form1.ClientHeight);
  PaintBox1.Canvas.Pen.Width := Random(50);

  PaintBox1.Canvas.Pen.Color := RGBToColor(Random(256), Random(256), Random(256));
  PaintBox1.Canvas.Line(20, 20, 20, 20);
end;


procedure TForm1.MenuItem4Click(Sender: TObject);
var
  styles: array[0..4] of TPenStyle = (psSolid, psDash, psDot, psDashDot, psDashDotDot);
begin
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(0, 0, Form1.ClientWidth, Form1.ClientHeight);
  PaintBox1.Canvas.Pen.Width := Random(50);

  PaintBox1.Canvas.Pen.Color := RGBToColor(Random(256), Random(256), Random(256));
  PaintBox1.Canvas.Pen.Style := styles[Random(5)];
  PaintBox1.Canvas.Line(20, 20, 20, 20);
end;


procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  task := 5;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  task := 6;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  task := 7;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  task := 8;
end;


procedure TForm1.PaintBox1Click(Sender: TObject);
var
  styles: array[0..4] of TPenStyle = (psSolid, psDash, psDot, psDashDot, psDashDotDot);
var
  coords: TPoint;
begin
  coords := PaintBox1.ScreenToClient(Mouse.CursorPos);
  if(task = 5) OR (task = 7) OR (task = 8) then
  begin
    if(task = 5) OR (task = 8) then
    begin
      PaintBox1.Canvas.Pen.Width := Random(50);
    end;

    PaintBox1.Canvas.Pen.Color := RGBToColor(Random(256), Random(256), Random(256));
  end;

  if(task = 5) then
  begin
    PaintBox1.Canvas.Pen.Style := styles[Random(5)];
    PaintBox1.Canvas.Brush.Color := clWhite;
    PaintBox1.Canvas.FillRect(0, 0, Form1.ClientWidth, Form1.ClientHeight);


    PaintBox1.Canvas.Line(coords.X, coords.Y, coords.X, coords.Y);
  end;

  if(task = 6) then
  begin
    PaintBox1.Canvas.Pen.Width := 10;
    PaintBox1.Canvas.Pen.Color := clRed;
  end;


  if(task = 6) OR (task = 7) OR (task = 8) then
  begin
     PaintBox1.Canvas.Pen.Style := psSolid;

     if(x = -1) OR (y = -1) then
     begin
        x := coords.X;
        y := coords.Y;
     end
     else
     begin
          PaintBox1.Canvas.Line(x, y, coords.X, coords.Y);
          x := coords.X;
          y := coords.Y;
     end;

  end;

end;


procedure TForm1.FormResize(Sender: TObject);
begin
  PaintBox1.Width := ClientWidth;
  PaintBox1.Height := ClientHeight;
end;


end.

