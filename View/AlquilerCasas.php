<?php include_once '../Controller/CasasController.php';

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Caso 2</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <link rel="stylesheet" href="dist/css/styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700">
</head>

<body class="hold-transition register-page fondoRegistroA">
    <div class="register-box">
        <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">Alquiler Casas</p>

                <?php
                if (isset($_POST["msj"])) {
                    echo '<div class="alert alert-danger TextoCentrado">' . $_POST["msj"] . '</div>';
                }
                ?>

                <form action="" method="post">

                    <div class="form-group">
                        <label for="selectDescripcion">Casa</label>
                        <div class="input-group mb-3">
                            <select id="selectDescripcion" name="selectDescripcion" class="form-control" required>
                                <?php ConsultarCasa($IdCasa); ?>
                            </select>
                        </div>
                    </div>

                    <label for="txtPrecio">Precio</label>
                    <div class="input-group mb-3">
                        <input id="txtPrecio" name="txtPrecio" type="number" class="form-control" readonly>
                        <div class="input-group-append">
                            <div class="input-group-text"></div>
                        </div>
                    </div>

                    <label for="txtUsuario">Usuario Alquiler</label>
                    <div class="input-group mb-3">
                        <input id="txtUsuario" name="txtUsuario" type="text" class="form-control" required>
                        <div class="input-group-append">
                            <div class="input-group-text"></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <button type="button" id="btnRegresar" name="btnRegresar"
                                class="btn btn-secondary btn-block" onclick="location.href='home.php'">Regresar</button>
                        </div>
                        <div class="col-6">
                            <button type="submit" id="btnAlquilar" name="btnAlquilar"
                                class="btn btn-success btn-block">Registrar</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <script src="plugins/jquery/jquery.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="dist/js/adminlte.min.js"></script>
    <script src="dist/js/usuarios.js"></script>
</body>

</html>