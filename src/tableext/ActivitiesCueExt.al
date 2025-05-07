tableextension 50100 "Ext Activities Cue" extends "Activities Cue"
{
    fields
    {
        field(1000; "Mantenimiento"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Registro de Vehículos" where("Necesita mantenimiento" = const(true)));

        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}