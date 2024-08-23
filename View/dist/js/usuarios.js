$(document).ready(function () {
    $('#selectDescripcion').change(function () {
        let IdCasa = $(this).val();

        if (IdCasa) {
            $.ajax({
                url: '../Controller/CasasController.php',
                type: 'POST',
                data: {
                    action: 'consultarPrecioCasa',
                    IdCasa: IdCasa
                },
                success: function (response) {
                    let data = JSON.parse(response);
                    $('#txtPrecio').val(data.PrecioCasa || 0);
                },
                error: function (xhr, status, error) {
                    console.error(xhr);
                }
            });
        }
    });
});
