codeunit 50101 "Control Fechas"
{
    procedure controlarFechaUltimoMantenimiento(mantenimiento: Record "Historial Mantenimientos")
    var
        vehiculo: Record "Registro de Vehículos";
        fechaMaxima: Date;
    begin
        fechaMaxima := 0D;
        if vehiculo.Get(mantenimiento.Vehiculo) then
            mantenimiento.SetRange(Vehiculo, vehiculo.Matricula);
        if mantenimiento.FindSet() then
            repeat

                if
                mantenimiento.Fecha > fechaMaxima then
                    fechaMaxima := mantenimiento.Fecha;
                vehiculo."Fecha ultimo mantenimiento" := fechaMaxima;

            until mantenimiento.Next() = 0;
        vehiculo.Modify(true);
    end;
}