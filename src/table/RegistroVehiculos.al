table 50100 "Registro de Vehículos"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Matricula; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Tipo; Enum "Tipos Vehiculos")
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Km Actual"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Fecha ultimo mantenimiento"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Necesita mantenimiento"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(PK; Matricula)
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




    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}