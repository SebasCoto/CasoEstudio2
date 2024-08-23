<?php include_once 'baseDatosModel.php';
    
    function ConsultarCasasBD()
    {
        $conexion = AbrirBaseDatos();
        $sentencia = "CALL consultarCasas()";
        $respuesta = $conexion -> query($sentencia);
        CerrarBaseDatos($conexion);
        return $respuesta;
    }

    function ConsultarPrecioCasa($IdCasa)
{
    $conexion = AbrirBaseDatos();
    $sentencia = $conexion->prepare("CALL consultarPrecioCasa(?)");
    $sentencia->bind_param("i", $IdCasa);
    $sentencia->execute();
    $resultado = $sentencia->get_result();
    $respuesta = $resultado->fetch_assoc();
    $sentencia->close();
    CerrarBaseDatos($conexion);
    return $respuesta;
}


    function AlquilerCasasBD($IdCasa,$UsuarioAlquiler)
    {
        $conexion = AbrirBaseDatos();
        $sentencia = "CALL actualizarCasas('$IdCasa','$UsuarioAlquiler')";
        $respuesta = $conexion -> query($sentencia);
        CerrarBaseDatos($conexion);
        return $respuesta;
    }

    function ConsultarCasaBD()
    {
        try
        {
            $conexion = AbrirBaseDatos();
            $sentencia = "CALL mostrarDescripcionCasa()";
            $respuesta = $conexion -> query($sentencia);
            CerrarBaseDatos($conexion);
            return $respuesta;
        }
        catch(Exception $ex)
        {
            return false;
        }
    }

?>