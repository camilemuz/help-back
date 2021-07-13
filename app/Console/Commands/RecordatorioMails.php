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
        
        $totalTickets = \DB::connection('help')
        ->where(\DB::table('public.ticket'))
        ->where('estado_id_estado','=',1)
            
        ;
        Mail::to('lemuzmujiquita@gmail.com ')->send(new MandarRecordatorio($totalTickets));
    }
}
