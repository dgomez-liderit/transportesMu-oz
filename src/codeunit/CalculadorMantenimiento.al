codeunit 50100 "Calculador Mantenimiento"
{
    procedure CalcularMantenimiento(vehiculo: Record "Registro de Vehículos")
    begin

        vehiculo."Necesita mantenimiento" := false;


        if vehiculo.Tipo = vehiculo.Tipo::Furgoneta then begin
            if vehiculo."Km Actual" >= 8000 then begin
                vehiculo."Necesita mantenimiento" := true;
                Message('La furgoneta %1 necesita mantenimiento (KM: %2)', vehiculo.Matricula, vehiculo."Km Actual");
            end;
        end
        else if vehiculo.Tipo = vehiculo.Tipo::Camion then begin
            if vehiculo."Km Actual" >= 9500 then begin
                vehiculo."Necesita mantenimiento" := true;
                Message('El camión %1 necesita mantenimiento (KM: %2)', vehiculo.Matricula, vehiculo."Km Actual");
            end;
        end;


        if vehiculo."Necesita mantenimiento" then
            vehiculo.Modify(true);
    end;

    procedure CalcularCosteMedioVehiculo(v: Record "Historial Mantenimientos")
    var
        Vehiculo: Record "Registro de Vehículos";
        HistorialMantenimiento: Record "Historial Mantenimientos";
        TotalCoste: Decimal;
        TotalMantenimientos: Integer;
    begin

        if not Vehiculo.Get(v.Vehiculo) then exit;


        Vehiculo."Km Actual" := 0;
        Vehiculo."Necesita mantenimiento" := false;

        HistorialMantenimiento.SetRange(Vehiculo, v.Vehiculo);
        if HistorialMantenimiento.FindSet() then begin
            repeat
                TotalCoste += HistorialMantenimiento.Coste;
                TotalMantenimientos += 1;
            until HistorialMantenimiento.Next() = 0;


            if TotalMantenimientos > 0 then begin
                case Vehiculo.Tipo of
                    Vehiculo.Tipo::Camion:
                        Vehiculo."Coste medio" := (TotalCoste / TotalMantenimientos) / 9500;
                    Vehiculo.Tipo::Furgoneta:
                        Vehiculo."Coste medio" := (TotalCoste / TotalMantenimientos) / 8000;
                end;
                Vehiculo."Total Mantenimientos" := TotalMantenimientos;
            end;
        end;


        Vehiculo.Modify(true);
    end;
}