
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
            column(Tipo; Tipo) { }
            column(Coste_medio; "Coste medio") { DecimalPlaces = 2 : 4; }
            column(Total_Mantenimientos; "Total Mantenimientos") { }
            trigger OnPreDataItem()
            begin
                if (codV <> '') then begin
                    SetRange("Matricula", codV);

                end;
                if (tipoFiltro = tipoFiltro::Camion) or (tipoFiltro = tipoFiltro::Furgoneta)
                then
                    SetRange(Tipo, tipoFiltro);
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
        tipoFiltro: Enum "Tipos Vehiculos";
}