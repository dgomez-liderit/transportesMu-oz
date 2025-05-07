table 50101 "Historial Mantenimientos"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Num Mantenimiento"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; Vehiculo; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Registro de Vehículos";
        }
        field(3; Fecha; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                vehiculo: Record "Registro de Vehículos";
            begin
                if vehiculo.Get(Rec.Vehiculo) then
                    vehiculo."Fecha ultimo mantenimiento" := Fecha;
                vehiculo.Modify(true);
            end;
        }
        field(4; Coste; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Descripcion; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Num Mantenimiento")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {

    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        v: Record "Registro de Vehículos";
    begin
        v.Get(Rec.Vehiculo);
        v."Km Actual" := 0;
        v.Modify(true);
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}