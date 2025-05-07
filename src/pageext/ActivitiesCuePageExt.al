pageextension 50100 "Ext Activities Cue" extends "O365 Activities"
{
    layout
    {
        addafter("MissingSIIEntries")
        {
            group("Transportes Muñoz")
            {
                field(Mantenimiento; Rec.Mantenimiento)
                {
                    Caption = 'Vehiuclos que necesitan mantenimiento';
                    ApplicationArea = All;
                    DrillDown = true;
                    Style = Strong;
                    StyleExpr = color;
                    trigger OnDrillDown()
                    var
                        vehiculos: Record "Registro de Vehículos";
                    begin

                        vehiculos.SetRange("Necesita mantenimiento", true);
                        Page.Run(Page::"Registro de Vehiculos", vehiculos);
                    end;
                }
            }
        }
    }



    var
        color: Text[20];

    trigger OnAfterGetRecord()
    begin
        color := 'Favorable';
        if (Rec.Mantenimiento = 1)
        then begin
            color := 'Ambiguous';
        end;
        if (Rec.Mantenimiento > 1)
        then begin
            color := 'Unfavorable';
        end;
    end;
}