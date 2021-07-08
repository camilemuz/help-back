<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class RecordatorioMails extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'recordatorio:mails';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Enviar recordatorio con el número de tickets no abiertos';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    // /**
    //  * Execute the console command.
    //  *
    //  * @return int
    //  */
    // public function handle()
    // {
    //     return 0;
    // }


    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        
        $totalTickets = \DB::connection('help')->select(
            "(select a.id_ticket, a.numero, a.estado_id_estado, a.requerimiento_id_requerimiento,
            a.fecha_registro, a.comentarios, a.activo,
c.nombre, c.ap_paterno, c.ap_materno, c.id_usuario
    from public.ticket a
    inner join public.asignado b on a.id_ticket = b.ticket_id_ticket
    inner join public.usuario c on b.usuario_id_usuario = c.id_usuario
     where a.numero = ? and b.baja_logica is false)
    union
    (select a.id_ticket, a.numero, a.estado_id_estado, a.requerimiento_id_requerimiento,
            a.fecha_registro, a.comentarios, a.activo, NULL, null, null, null
    from public.ticket a
    where a.numero = ? and a.id_padre is null)
    order by fecha_registro", [$numero, $numero]
        );
        
    }
}
