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
}