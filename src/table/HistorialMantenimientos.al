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
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

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