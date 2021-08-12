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
use App\Models\Prioridad;
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
        // if (($this->obtieneIdUsuario($request->input('usuario'), Rol::ADMINISTRADOR)) == null){
        //     return  response()->json([
        //         'respuesta' => false,
        //         'mensaje' => 'Usuario no autorizado para ver las solicitudes'
        //     ]);
        // }
        $tipoRequerimiento = TipoRequerimiento::findOrFail($request->input('id_tipo_req'));
        $tipoRequerimiento->baja_logica = true;
        $tipoRequerimiento->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Categoria eliminada con éxito'
        ]);
    }



    public function municipio(){
        $municipio = Municipio::where('baja_logica', false)
            ->orderBy('id_lugar', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'municipios' => $municipio
       /* return response()->json([
            'respuesta' => true,
            'municipios' => Municipio::all()*/
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
    public function indexsucursal (Request $request){
        $sucursal = Sucursal::where('baja_logica', false)
            ->orderBy('id_sucursal', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'sucursales' => $sucursal
        ]);
    }
    public function storesucursal(Request $request)
    {
        $this->validate($request, [
            'cod' => ['required'],
            'sucursal' => ['required'],
            'municipio_id_lugar' => ['required'],

        ]);
        $sucursal = new Sucursal();
        $sucursal->cod = $request->cod;
        $sucursal->sucursal = $request->sucursal;
        $sucursal->municipio_id_lugar = $request->municipio_id_lugar;

        $sucursal->save();

        return response()->json([
            'respuesta'=>true,
            'mensaje'=>'Sucursal creada con éxito'
        ]);
    }
    public function updatesucursal(Request $request, $id)
    {
        $this->validate($request, [
            'cod' => [],
            'sucursal' => [],
            'municipio_id_lugar' => [],

        ]);
        $sucursal = Sucursal::findOrFail($id);
        $sucursal->cod = $request->input('cod');
        $sucursal->sucursal = $request->input('sucursal');
        $sucursal->municipio_id_lugar = $request->input('municipio_id_lugar');
        $sucursal->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Sucursal editada con éxito'
        ]);
    }

    public function eliminarsucursal(Request $request)
    {
        /*if (($this->obtieneIdUsuario($request->input('usuario'), Rol::ADMINISTRADOR)) == null){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Usuario no autorizado para ver las solicitudes'
            ]);
        }*/
        $sucursal = Sucursal::findOrFail($request->input('id_sucursal'));
        $sucursal->baja_logica = true;
        $sucursal->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'sucursal eliminada con éxito'
        ]);
    }


    // public function departamento(){
    //     return response()->json([
    //         'respuesta' => true,
    //         'departamentos' => Departamento::all()
    //     ]);
    // }

    public function departamento(){
        $departamento = Departamento::where('baja_logica', false)
        ->orderBy('id_departamento', 'asc')
        ->get();
    return response()->json([
        'respuesta' => true,
        'departamentos' => $departamento
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
    public function indexdivision (Request $request){
        $division = Division::where('baja_logica', false)
            ->orderBy('id_division', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'divisiones' => $division
        ]);
    }
    public function storedivision(Request $request)
    {
        $this->validate($request, [
            'cod' => ['required'],
            'division' => ['required'],

        ]);
        $division = new Division();
        $division->cod = $request->cod;
        $division->division = $request->division;

        $division->save();

        return response()->json([
            'respuesta'=>true,
            'division'=> $division
        ]);
    }
    public function updatedivision(Request $request, $id)
    {
        $this->validate($request, [
            'cod' => [],
            'division' => [],

        ]);
        $division = Division::findOrFail($id);
        $division->cod = $request->input('cod');
        $division->division = $request->input('division');
        $division->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Division editada con éxito'
        ]);
    }

    public function eliminardivision(Request $request)
    {
        /*if (($this->obtieneIdUsuario($request->input('usuario'), Rol::ADMINISTRADOR)) == null){
            return  response()->json([
                'respuesta' => false,
                'mensaje' => 'Usuario no autorizado para ver las solicitudes'
            ]);
        }*/
        $division = Division::findOrFail($request->input('id_division'));
        $division->baja_logica = true;
        $division->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Division eliminada con éxito'
        ]);
    }




    public function cargo(){
        $cargo = cargo::where('baja_logica', false)
            ->orderBy('id_cargo', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'cargos' => $cargo
        ]);


    }

    // public function cargo(){
    //     return response()->json([
    //         'respuesta' => true,
    //         'cargos' => Cargo::all()
    //     ]);
    // }
    public function indexcargo (Request $request){
        $cargo = Cargo::where('baja_logica', false)
            ->orderBy('id_cargo', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'cargos' => $cargo
        ]);
    }
    public function storecargo(Request $request)
    {
        $this->validate($request, [
            'cod' => ['required'],
            'cargo' => ['required'],
            'prioridad_id_prioridad' => ['required']

        ]);
        $cargo = new Cargo();
        $cargo->cod = $request->cod;
        $cargo->cargo = $request->cargo;
        $cargo->prioridad_id_prioridad = $request->prioridad_id_prioridad;

        $cargo->save();

        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Cargo creado con éxito'
        ]);
    }
    public function updatecargo(Request $request, $id)
    {
        $this->validate($request, [
            'cod' => [],
            'cargo' => [],
            'prioridad_id_prioridad' => []

        ]);
        $cargo = Cargo::findOrFail($id);
        $cargo->cod = $request->input('cod');
        $cargo->cargo = $request->input('cargo');
        $cargo->prioridad_id_prioridad = $request->input('prioridad_id_prioridad');
        $cargo->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Cargo editado con éxito'
        ]);
    }

    public function eliminarcargo(Request $request)
    {
        /* if (($this->obtieneIdUsuario($request->input('usuario'), Rol::ADMINISTRADOR)) == null){
             return  response()->json([
                 'respuesta' => false,
                 'mensaje' => 'Usuario no autorizado para ver las solicitudes'
             ]);
         }*/
        $cargo = Cargo::findOrFail($request->input('id_cargo'));
        $cargo->baja_logica = true;
        $cargo->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Cargo eliminado con éxito'
        ]);
    }


    public function prioridad(){
        return response()->json([
            'respuesta' => true,
            'prioridades' => Prioridad::all()
        ]);
    }
    public function indexprioridad (Request $request){
        $cargo = Cargo::where('baja_logica', false)
            ->orderBy('id_prioridad', 'asc')
            ->get();
        return response()->json([
            'respuesta' => true,
            'prioridads' => $prioridad
        ]);
    }
    public function storeprioridad(Request $request)
    {
        $this->validate($request, [
            'cod' => ['required'],
            'prioirdad' => ['required'],
            

        ]);
        $prioridad = new Prioridad();
        $prioridad->cod = $request->cod;
        $prioridad->prioridad = $request->prioridad;
        $prioridad->save();

        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Prioridad creada con éxito'
        ]);
    }
    public function updateprioridad(Request $request, $id)
    {
        $this->validate($request, [
            'cod' => [],
            'prioridad' => [],
            
        ]);
        $prioridad = Prioridad::findOrFail($id);
        $prioridad->cod = $request->input('cod');
        $prioridad->prioridad = $request->input('prioridad');
        $prioridad->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Prioridad editada con éxito'
        ]);
    }

    public function eliminarprioridad(Request $request)
    {
       
        $prioridad = Prioridad::findOrFail($request->input('id_prioridad'));
        $prioridad->baja_logica = true;
        $prioridad->save();
        return response()->json([
            'respuesta' => true,
            'mensaje' => 'Prioridad eliminada con éxito'
        ]);
    }

    public function rol(){
        return response()->json([
            'respuesta' => true,
            'roles' => Rol::all()
        ]);
    }
}
