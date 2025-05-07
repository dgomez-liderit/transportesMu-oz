page 50100 "Registro de Vehiculos"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Registro de Vehículos";
    CardPageId = 50101;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Matricula; Rec.Matricula)
                {
                    ApplicationArea = All;
                }
                field(Tipo; Rec.Tipo)
                {
                    ApplicationArea = All;
                }
                field("Km Actual"; Rec."Km Actual")
                {
                    ApplicationArea = All;
                }
                field("Fecha ultimo mantenimiento"; Rec."Fecha ultimo mantenimiento")
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
            action("Ver Vehiculo")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = GoTo;

                trigger OnAction()
                var
                    v: Record "Registro de Vehículos";
                begin
                    v.SetRange("Matricula", Rec.Matricula);
                    Page.Run(Page::"Tarjeta Vehiculo", v);
                end;
            }
        }
    }
}