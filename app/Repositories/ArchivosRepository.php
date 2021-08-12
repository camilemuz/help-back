<?php

namespace App\Repositories;

use App\Traits\ConsumirServiciosExternos;

class ArchivosRepository
{
    use ConsumirServiciosExternos;

    public $baseUri;

    public $secret;

    public function __construct()
    {
        $this->baseUri = config('microservicios.archivos.base_uri');
    }

    public function registrarArchivo($archivo, Array $datosAdicionales = [])
    {
        return $this->performFileStoreRequest('archivo', $archivo, $datosAdicionales);
    }

    public function eliminarArchivo($rutaArchivo, Array $datosAdicionales = [])
    {
        return $this->performFileDestroyRequest('archivo/' . $rutaArchivo, $datosAdicionales);
    }
}