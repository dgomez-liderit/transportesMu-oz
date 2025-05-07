
report 50100 "Informe Transportes Muñoz"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'InformeTransportesMunoz.rdl';
    Caption = 'Informe Transportes Muñoz';

    dataset
    {
        dataitem(DataItemName; "Registro de Vehículos")
        {
            column(Matricula; Matricula) { }
            column(Coste_medio; "Coste medio") { }
            column(Total_Mantenimientos; "Total Mantenimientos") { }
            trigger OnPreDataItem()
            begin
                if (codV <> '') then begin
                    SetRange("Matricula", codV);
                end;
            end;
        }

    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(Filtros)
                {
                    field("Filtrado por matricula"; codV)
                    {
                        ApplicationArea = All;
                        TableRelation = "Registro de Vehículos".Matricula;
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }

    var
        codV: Text[20];
}