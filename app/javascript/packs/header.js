$(document).ready(function(){
    $( "#header-collapse-button" ).on('click', function(){
        $('#navbarSide').addClass('reveal');
    });

    $('.close-header-navbar-sidebar').on('click', function(){
        $('#navbarSide').removeClass('reveal');
    });
});