<?php

namespace App\Http\Controllers;

use App\Models\DptoSucursal;
use App\Models\Estado;
use App\Models\Requerimiento;
use App\Models\Rol;
use App\Models\Ticket;
use App\User;
use Illuminate\Http\Request;
use Namshi\JOSE\SimpleJWS;

class SolicitudRequerimientoController extends Controller
{
    public function solicitudReq(Request $request){
        //validamos el token enviado
        if ($this->validaToken($request->input('token'))){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Tiempo de sesión ha terminado'
            ]);
        }

        if ($this->obtieneIdUsuario($request->input('email')) == null){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Usuario no autorizado para el registro'
            ]);
        }

        //se crea el requerimiento en BD
        $requerimiento = new Requerimiento();
        $requerimiento->descripcion = $request->input('descripcion');
        $requerimiento->interno = $request->input('interno');
        $requerimiento->archivo = ($request->input('archivo'));
        $requerimiento->usuario_id_usuario = $this->obtieneIdUsuario($request->input('email'));
        $requerimiento->departamento_id_departamento = $request->input('departamento_id_departamento');
        $requerimiento->tipo_requerimiento_id_tipo_req = $request->input('tipo_requerimiento_id_tipo_req');
        $requerimiento->sucursal_id_sucursal = $request->input('sucursal_id_sucursal');
        $respuesta = $requerimiento->save();

        if ($respuesta){
            //a la par se crea el TIcket en espera
            $ticket = new Ticket();
            //momentaneo
            $ticket->numero = $this->generarCodigo();
            $ticket->estado_id_estado = Estado::EN_ESPERA;
            $ticket->requerimiento_id_requerimiento = $requerimiento->id_requerimiento;
            //TODO
            $ticket->comentarios = '';
            $respuesta = $ticket->save();
            $detalles = [
                'titulo' => 'Confirmación',
                'body' => "Su solicitud fue creada con éxito, con la descripción: $requerimiento->descripcion.Se le mandará un correo cuando un agente haya tomado su Requerimiento.",
                'descripcion' =>"El número de su ticket es: $ticket->numero"
            ];
            \Mail::to($request->input('email'))->send(new \App\Mail\InvoiceMail($detalles));
            if ($respuesta){
                return response()->json([
                    'respuesta' => true,
                    'requerimiento' => $requerimiento
                ]);
            }
            return response()->json([
                'respuesta' => true,
                'mensaje' => 'Error al guardar los datos en la Base de Datos'
            ]);

        }
        return response()->json([
            'respuesta' => false,
            'mensaje' => 'Error al guardar los datos en la Base de Datos'
        ]);
    }


    public function editarRequerimiento(Request $request){
        //validamos el token enviado
        if ($this->validaToken($request->input('token'))){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Tiempo de sesión ha terminado'
            ]);
        }

        if ($this->obtieneIdUsuario($request->input('email')) == null){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Usuario no autorizado para el registro'
            ]);
        }

        //se crea el requerimiento en BD
        $requerimiento = Requerimiento::findOrFail($request->input('id_requerimiento'));
        $requerimiento->descripcion = $request->input('descripcion');
        $requerimiento->interno = $request->input('interno');
        $requerimiento->archivo = ($request->input('archivo'));
        $requerimiento->usuario_id_usuario = $this->obtieneIdUsuario($request->input('email'));
        $requerimiento->departamento_id_departamento = $request->input('departamento_id_departamento');
        $requerimiento->tipo_requerimiento_id_tipo_req = $request->input('tipo_requerimiento_id_tipo_req');
        $requerimiento->sucursal_id_sucursal = $request->input('sucursal_id_sucursal');
        $respuesta = $requerimiento->save();
        if ($respuesta){
            return  response()->json([
                'respuesta' => true,
                'mensaje' => 'Requerimiento modificado con exito'
            ]);
        }
    }

    private function validaToken($token){
        $secreto = config('jwt.secret');
        $jws = SimpleJWS::load($token);
        if (!$jws->isValid($secreto)){
            return true;
        }
        return false;
    }

    private function obtieneIdUsuario($email){
        $usuario = User::where('email', $email)
            ->where('baja_logica', false)
            /*->where('rol_id_rol', Rol::FUNCIONARIO)*/
            ->first();
        if ($usuario == null) return null;
        else return $usuario->id_usuario;
    }

    private function generarCodigo(){
        $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        while (true){
            $codigo = substr(str_shuffle($caracteres), 0, 5);
            $respuesta = Ticket::where('numero', $codigo)
                ->first();
            if ($respuesta == null){
                return $codigo;
            }
        }
    }


    public function solicitudAgente(Request $request){
        //validamos el token enviado
        if ($this->validaToken($request->input('token'))){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Tiempo de sesión ha terminado'
            ]);
        }

        /*if ($this->obtieneIdUsuario($request->input('email')) == null){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Usuario no autorizado para el registro'
            ]);
        }*/


        $requerimiento = new Requerimiento();
        $requerimiento->descripcion = $request->input('descripcion');
        $requerimiento->interno = $request->input('interno');
        // $requerimiento->media = $request->input('media');
        $requerimiento->usuario_id_usuario = $request->input('usuario_id_usuario');
        $requerimiento->departamento_id_departamento = $request->input('departamento_id_departamento');
        $requerimiento->tipo_requerimiento_id_tipo_req = $request->input('tipo_requerimiento_id_tipo_req');
        $requerimiento->sucursal_id_sucursal = $request->input('sucursal_id_sucursal');
        $respuesta = $requerimiento->save();

        if ($respuesta){
            //a la par se crea el TIcket en espera
            $ticket = new Ticket();
            //momentaneo
            $ticket->numero = $this->generarCodigo();
            $ticket->estado_id_estado = Estado::EN_ESPERA;/*$requerimiento->estado_id_estado;*/
            $ticket->requerimiento_id_requerimiento = $requerimiento->id_requerimiento;
            //TODO
            $ticket->comentarios = '';
            $respuesta = $ticket->save();
           $detalles = [
                'titulo' => 'Confirmación',
                'body' => "Su solicitud fue creada con éxito, con la descripción: $requerimiento->descripcion.Se le mandará un correo cuando un agente haya tomado su Requerimiento.",
                'descripcion' =>"El número de su ticket es: $ticket->numero"
            ];
            \Mail::to($request->input('email'))->send(new \App\Mail\InvoiceMail($detalles));

            if ($respuesta){
                return response()->json([
                    'respuesta' => true,
                    'requerimiento' => $requerimiento
                ]);
            }
            return response()->json([
                'respuesta' => true,
                'mensaje' => 'Error al guardar los datos en la Base de Datos'
            ]);

        }
        return response()->json([
            'respuesta' => false,
            'mensaje' => 'Error al guardar los datos en la Base de Datos'
        ]);
    }
    public function adicionarImagen(Requerimiento $requerimiento, Request $request)
    {
        $this->validate($request, [
            'imagen' => 'required'
        ]);
        $conexion->adicionaImagen($request->imagen);
        return response()->json(['data' => $requerimiento], 201);
    }
    
}



