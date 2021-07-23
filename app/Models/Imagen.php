<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Imagen extends Model
{
    use HasFactory;
    protected $connection = 'help';
    protected $table = 'public.imagen';
    protected $primaryKey = 'id_imagen';
    public $incrementing = true;
    public $timestamps = false;
    protected $fillable = [
        'ruta'
    ];

    protected $appends = [
        'ruta_global',
    ];

    protected $hidden = [
        'imageable_type',
        'imageable_id',
        'baja_logica', 
        'fecha_registro', 
        'usuario_registro', 
        'ip_registro'
    ];

    /**
     * Get the owning imageable model.
     */
    public function imageable()
    {
        return $this->morphTo();
    }

    public function getRutaGlobalAttribute()
    {
        return config('microservicios.archivos.url_acceso') . $this->ruta;
    }
}
