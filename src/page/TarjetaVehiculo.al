page 50101 "Tarjeta Vehiculo"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Registro de Vehículos";

    layout
    {
        area(Content)
        {
            group("Transportes Muñoz")
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
                field("Necesita mantenimiento"; Rec."Necesita mantenimiento")
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
            action("Ver historial mantenimientos")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = GetOrder;

                RunObject = page "Historial Mantenimientos";
                RunPageLink = Vehiculo = field(Matricula);
                RunPageMode = View;


            }
            action("Sacar a circular")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = CreditCard;

                trigger OnAction()
                var
                    v: Record "Registro de Vehículos";
                begin
                    v.Get(Rec.Matricula);
                    v."Km Actual" += 1000;
                    v.Modify();


                    Message('El %1 ha salido a circular, se han sumado los km recorridos', Rec.Tipo);
                end;

            }
        }
    }
    trigger OnAfterGetRecord()

    begin

        Rec."Necesita mantenimiento" := false;


        if Rec.Tipo = Rec.Tipo::Furgoneta then begin
            if Rec."Km Actual" >= 8000 then begin
                Rec."Necesita mantenimiento" := true;
                Message('La furgoneta %1 necesita mantenimiento (KM: %2)', Rec.Matricula, Rec."Km Actual");
            end;
        end
        else if Rec.Tipo = Rec.Tipo::Camion then begin
            if Rec."Km Actual" >= 9500 then begin
                Rec."Necesita mantenimiento" := true;
                Message('El camión %1 necesita mantenimiento (KM: %2)', Rec.Matricula, Rec."Km Actual");
            end;
        end;


        if Rec."Necesita mantenimiento" then
            Rec.Modify(true);
    end;
}