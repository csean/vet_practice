
$(document).ready( function() {
    $('#appointment_customer_id').change(function() {
        var id = $(this).val();
        if (id != 0 ) {
            var url = '/customers/' + id + '/pets.json'
            $.ajax({
                type: 'GET',
                url: url,
                success: function(data) {
                    $('#appointment_pet_id').empty();
                    $.each(data, function(key, value) {
                        $('#appointment_pet_id').append($("<option></option>")
                            .attr("value", value.id).
                            text(value.name));
                    });
                }
            });
        }
    });
});
