<?php include_once '../Model/CasasModel.php';

    function ConsultarCasas()
    {
        $respuesta = ConsultarCasasBD();

        if($respuesta -> num_rows > 0)
        {
            while ($row = mysqli_fetch_array($respuesta)) 
            { 
                echo "<tr>";
                echo "<td>" . $row["IdCasa"] . "</td>";
                echo "<td>" . $row["DescripcionCasa"] . "</td>";
                echo "<td>" . $row["PrecioCasa"] . "</td>";
                echo "<td>" . $row["UsuarioAlquiler"] . "</td>";
                echo "<td>" . $row["Fecha"] . "</td>";
                echo '<td>
                        

                     </td>';
                echo "</tr>";
            }
        }
    }

    if (isset($_POST['action']) && $_POST['action'] == 'consultarPrecioCasa') {
        $IdCasa = $_POST['IdCasa'];
        $precioCasa = ConsultarPrecioCasa($IdCasa);
        echo json_encode($precioCasa);
        exit();
    }
    


    if(isset($_POST["btnAlquilar"]))
    {
        $IdCasa = $_POST["selectDescripcion"];
        $UsuarioAlquiler = $_POST["txtUsuario"];
        

        $respuesta = AlquilerCasasBD($IdCasa,$UsuarioAlquiler);

        if($respuesta == true)
        {
             
            header("location: ../View/consultaCasas.php");
        }
        else
        {
            $_POST["msj"] = "No se ha podido Alquilar.";
        }
    }



    function ConsultarCasa($IdCasa)
    {
        $respuesta = ConsultarCasaBD();
       
        
        if($respuesta -> num_rows > 0)
        {
            while ($row = mysqli_fetch_array($respuesta)) 
            { 
                if($IdCasa == $row["IdCasa"])
                {
                    echo "<option selected value=" . $row["IdCasa"] . ">" . $row["DescripcionCasa"] . "</option>";
                }
                else
                {
                    echo "<option value=" . $row["IdCasa"] . ">" . $row["DescripcionCasa"] . "</option>";
                }
            }
        }
    }
?>