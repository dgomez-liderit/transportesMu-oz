page 50102 "Historial Mantenimientos"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Historial Mantenimientos";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Vehiculo; Rec.Vehiculo)
                {
                    ApplicationArea = All;
                }
                field(Coste; Rec.Coste)
                {
                    ApplicationArea = All;
                }
                field(Fecha; Rec.Fecha)
                {
                    ApplicationArea = All;
                }
                field(Descripcion; Rec.Descripcion)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}