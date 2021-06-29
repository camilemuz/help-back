<?php

namespace App\Http\Controllers;
use App\Models\Cargo;
use App\Models\Categoria;
use App\Models\Departamento;
use App\Models\Division;
use App\Models\Municipio;
use App\Models\Rol;
use App\Models\Sucursal;
use App\Models\TipoRequerimiento;
use App\User;
use Illuminate\Http\Request;

class ParametroController extends Controller
{
    public function categoria(){
        $categoria = Categoria::where('baja_logica', false)
            ->orderBy('id_categoria', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'categorias' => $categoria
        ]);


    }

    public function indexcat (Request $request){
        $categoria = Categoria::where('baja_logica', false)
            ->orderBy('id_categoria', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'categorias' => $categoria
        ]);
    }
    public function storecat(Request $request)
    {
        $this->validate($request, [
            'cod' => ['required'],
            'categoria' => ['required'],

        ]);
        $categoria = new Categoria();
        $categoria->cod = $request->cod;
        $categoria->categoria = $request->categoria;

        $categoria->save();

        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Categoria creada con éxito'
        ]);
    }
    public function updateCategoria(Request $request, $id)
    {
        $this->validate($request, [
            'cod' => [],
            'categoria' => [],

        ]);
        $categoria = Categoria::findOrFail($id);
        $categoria->cod = $request->input('cod');
        $categoria->categoria = $request->input('categoria');
        $categoria->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Categoria editada con éxito'
        ]);
    }

    public function eliminarCategoria(Request $request)
    {
       /* if (($this->obtieneIdUsuario($request->input('usuario'), Rol::ADMINISTRADOR)) == null){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Usuario no autorizado para ver las solicitudes'
            ]);
        }*/
        $categoria = Categoria::findOrFail($request->input('id_categoria'));
        $categoria->baja_logica = true;
        $categoria->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Categoria eliminada con éxito'
        ]);
    }



    public function tipoRequerimiento($id){
        $tipoRequerimientos = TipoRequerimiento::where('categoria_id_categoria', $id)
            ->get();
        if (count($tipoRequerimientos) > 0){
            return response()->json([
                'respuesta' => true,
                'tipoRequerimientos' => $tipoRequerimientos
            ]);
        }
        return response()->json([
            'respuesta' => false,
            'mensaje' => 'No se ha encontrado registros'
        ]);
    }
    public function indextiporeq (Request $request){
        $tipoRequerimiento = TipoRequerimiento::where('baja_logica', false)
            ->orderBy('id_tipo_req', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'tipoRequerimientos' => $tipoRequerimiento
        ]);
    }
    public function storetiporeq(Request $request)
    {
        $this->validate($request, [
            'cod' => ['required'],
            'sub_cat' => ['required'],
            'categoria_id_categoria' => ['required'],
            'division_id_division' => ['required'],

        ]);
        $tipoRequerimiento = new tipoRequerimiento();
        $tipoRequerimiento->cod = $request->cod;
        $tipoRequerimiento->sub_cat = $request->sub_cat;
        $tipoRequerimiento->categoria_id_categoria = $request->categoria_id_categoria;
        $tipoRequerimiento->division_id_division = $request->division_id_division;

        $tipoRequerimiento->save();

        return response()->json([
            'respuesta'=>true,
            'TipoRequerimiento'=>$tipoRequerimiento]);
    }
    public function updatetiporeq(Request $request, $id)
    {
        $this->validate($request, [
            'cod' => [],
            'sub_cat' => [],
            'categoria_id_categoria' => [],
            'division_id_division' => [],

        ]);
        $tipoRequerimiento = TipoRequerimiento::findOrFail($id);
        $tipoRequerimiento->cod = $request->input('cod');
        $tipoRequerimiento->sub_cat = $request->input('sub_cat');
        $tipoRequerimiento->categoria_id_categoria = $request->input('categoria_id_categoria');
        $tipoRequerimiento->division_id_division = $request->input('division_id_division');
        $tipoRequerimiento->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Sub categoría editada con éxito'
        ]);
    }

    public function eliminartiporeq (Request $request)
    {
        if (($this->obtieneIdUsuario($request->input('usuario'), Rol::ADMINISTRADOR)) == null){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Usuario no autorizado para ver las solicitudes'
            ]);
        }
        $tipoRequerimiento = TipoRequerimiento::findOrFail($request->input('id_tipo_req'));
        $tipoRequerimiento->baja_logica = true;
        $tipoRequerimiento->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Categoria eliminada con éxito'
        ]);
    }



    public function municipio(){
        return response()->json([
            'respuesta' => true,
            'municipios' => Municipio::all()
        ]);
    }
 public function indexmunicipio (Request $request){
        $municipio = Municipio::where('baja_logica', false)
            ->orderBy('id_lugar', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'municipios' => $municipio
        ]);
    }
    public function storemunicipio(Request $request)
    {
        $this->validate($request, [
            'cod' => ['required'],
            'lugar' => ['required'],

        ]);
        $municipio = new Municipio();
        $municipio->cod = $request->cod;
        $municipio->lugar = $request->lugar;

        $municipio->save();

        return response()->json([
            'respuesta'=>true,
            'mensaje'=>'Municipio creado con éxito'
        ]);
    }
    public function updatemunicipio(Request $request, $id)
    {
        $this->validate($request, [
            'cod' => [],
            'lugar' => [],

        ]);
        $municipio = Municipio::findOrFail($id);
        $municipio->cod = $request->input('cod');
        $municipio->lugar = $request->input('lugar');
        $municipio->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Municipio editado con éxito'
        ]);
    }

    public function eliminarmunicipio(Request $request)
    {
        /*if (($this->obtieneIdUsuario($request->input('usuario'), Rol::ADMINISTRADOR)) == null){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Usuario no autorizado para ver las solicitudes'
            ]);
        }*/
        $municipio = Municipio::findOrFail($request->input('id_lugar'));
        $municipio->baja_logica = true;
        $municipio->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Municipio eliminado con éxito'
        ]);
    }


    public function sucursal($id){
        $sucursales = Sucursal::where('municipio_id_lugar', $id)
            ->get();
        if (count($sucursales) > 0){
            return response()->json([
                'respuesta' => true,
                'sucursales' => $sucursales
            ]);
        }
        return response()->json([
            'respuesta' => false,
            'mensaje' => 'No se ha encontrado sucursales'
        ]);
    }


    public function departamento(){
        return response()->json([
            'respuesta' => true,
            'departamentos' => Departamento::all()
        ]);
    }
    public function indexdepartamento (Request $request){
        $departamento = Departamento::where('baja_logica', false)
            ->orderBy('id_departamento', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'departamentos' => $departamento
        ]);
    }
    public function storedepartamento(Request $request)
    {
        $this->validate($request, [
            'cod' => ['required'],
            'departamento' => ['required'],

        ]);
        $departamento = new Departamento();
        $departamento->cod = $request->cod;
        $departamento->departamento = $request->departamento;

        $departamento->save();

        return response()->json([
            'respuesta'=>true,
            'departamento'=> $departamento
        ]);
    }
    public function updatedepartamento(Request $request, $id)
    {
        $this->validate($request, [
            'cod' => [],
            'departamento' => [],

        ]);
        $departamento = Departamento::findOrFail($id);
        $departamento->cod = $request->input('cod');
        $departamento->departamento = $request->input('departamento');
        $departamento->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Departamento editado con éxito'
        ]);
    }

    public function eliminardepartamento(Request $request)
    {
        /*if (($this->obtieneIdUsuario($request->input('usuario'), Rol::ADMINISTRADOR)) == null){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Usuario no autorizado para ver las solicitudes'
            ]);
        }*/
        $departamento = Departamento::findOrFail($request->input('id_departamento'));
        $departamento->baja_logica = true;
        $departamento->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Departamento eliminado con éxito'
        ]);
    }



    public function division(){
        return response()->json([
            'respuesta' => true,
            'divisiones' => Division::all()
        ]);
    }

    public function cargo(){
        return response()->json([
            'respuesta' => true,
            'cargos' => Cargo::all()
        ]);
    }

    public function rol(){
        return response()->json([
            'respuesta' => true,
            'roles' => Rol::all()
        ]);
    }
}
