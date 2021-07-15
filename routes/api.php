<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', 'UsuarioController@login');
Route::post('registro', 'UsuarioController@registro');
Route::post('/logout', 'UsuarioController@logout');
Route::post('/recurso_usuario', 'UsuarioController@recursoUsuario');

Route::group(['prefix' => 'parametros'], function() {
    Route::get('categoria', 'ParametroController@categoria');
    Route::post('indexcat', 'ParametroController@indexcat');
    Route::post('storecat', 'ParametroController@storecat');
    Route::put('updatecat/{id}', 'ParametroController@updateCategoria');
    Route::post('eliminarcat', 'ParametroController@eliminarCategoria');

    Route::get('tipo_requerimiento/{id}', 'ParametroController@tipoRequerimiento');
    Route::get('indextiporeq', 'ParametroController@indextiporeq');
    Route::post('storetiporeq', 'ParametroController@storetiporeq');
    Route::put('updatetiporeq/{id}', 'ParametroController@updatetiporeq');
    Route::post('eliminarmun', 'ParametroController@eliminarmunicipio');

    Route::get('municipio', 'ParametroController@municipio');
    Route::get('indexmun', 'ParametroController@indexmunicipio');
    Route::post('storemun', 'ParametroController@storemunicipio');
    Route::put('updatemun/{id}', 'ParametroController@updatemunicipio');
    Route::post('eliminarmun', 'ParametroController@eliminarmunicipio');

    Route::get('sucursal/{id}', 'ParametroController@sucursal');

    Route::get('departamento', 'ParametroController@departamento');
    Route::post('indexdpto', 'ParametroController@indexdepartamento');
    Route::post('storedpto', 'ParametroController@storedepartamento');
    Route::put('updatedpto/{id}', 'ParametroController@updatedepartamento');
    Route::post('eliminardpto', 'ParametroController@eliminardepartamento');

    Route::get('division', 'ParametroController@division');

    Route::get('cargo', 'ParametroController@cargo');
    Route::post('indexcargo', 'ParametroController@indexcargo');
    Route::post('storecargo', 'ParametroController@storecargo');
    Route::put('updatecargo/{id}', 'ParametroController@updatecargo');
    Route::post('eliminarcargo', 'ParametroController@eliminarcargo');

    Route::get('rol', 'ParametroController@rol');
    Route::get('usuarios', 'UsuarioController@usuarios');
});

Route::group(['prefix' => 'funcionario'], function() {
    Route::post('solicitar_req', 'SolicitudRequerimientoController@solicitudReq');
    Route::post('solicitud_agen', 'SolicitudRequerimientoController@solicitudAgente');
    Route::post('ver_solicitudes', 'TicketController@verSolicitudes');
    Route::post('calificacion', 'TicketController@calificacion');
    Route::post('editar_req', 'SolicitudRequerimientoController@editarRequerimiento');
});
Route::group(['prefix' => 'agente'], function() {
    Route::post('tickets', 'TicketController@listadoReq');
    Route::post('elegir_ticket', 'TicketController@elegirTicket');
    Route::post('tomar_ticket', 'TicketController@tomarTicket');
    Route::post('terminar_ticket', 'TicketController@terminarTicket');
    Route::post('historico', 'TicketController@historico');
    Route::post('cambiar_estado', 'TicketController@cambiarEstado');
    Route::get('ticket/{id_ticket}', 'TicketController@ticket');
    Route::get('listado', 'UsuarioController@listarAgentes');
    Route::post('cambio_agente', 'TicketController@cambioAgente');
    
    Route::get('enviar_correo_proceso', 'TicketController@ticketProceso');
});
Route::group(['prefix' => 'admin'], function() {
    Route::put('store/{id}', 'UsuarioController@store');
    Route::post('index', 'UsuarioController@index');

    Route::post('eliminar', 'UsuarioController@eliminar');
    Route::post('registroAdmin', 'UsuarioController@registroAdmin');
});
