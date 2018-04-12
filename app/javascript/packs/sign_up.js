$(document).ready(function(){
    $("#avatar-sign-up,#avatar-profile").change(function(e) {
        var fileName;
        fileName = e.target.files[0].name;
        $("#p-sign-up-avatar,#p-profile-avatar").html(fileName);
    });
});