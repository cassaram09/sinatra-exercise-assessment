$(".add").click(function() {
    $("form > p:first-of-type").clone(true).insertBefore("form > p:last-of-type");
    return false;
});

$(".remove").click(function() {
    $(this).parent().remove();
});
