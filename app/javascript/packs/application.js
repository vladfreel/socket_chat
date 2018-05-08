/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


import 'jquery/src/jquery'
import 'jquery-ujs/src/rails'
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap/dist/css/bootstrap-theme'
import 'bootstrap/dist/js/bootstrap';
import 'packs/sign_up'
import 'packs/actioncable_connect'
import 'style/application.scss'
import 'images/default_avatar.png'
// import '../components/messages/MessageBox'

console.log('Hello World from Webpacker');
$(document).ready(function() {
    // var button = $('.b_edit_message');
    // button.click(function() {
    //     console.log(button);
    //     $('#edit_message' + button.data()).data("hidden", false);
    //     button.hide();
    // });
    $(".b_edit_message").on('click',function() {
        var text = $(this).data('id');
        $('#edit_message' + text.toString()).show();
        $('#message' + text.toString()).hide();
        $(this).hide();
    });

    console.log(document.cookie);
    // console.log(getUserIdFromCookies());

    function getUserIdFromCookies() {
        var cookies = document.cookie.split(';');
        var splitedCookies = [];
        cookies.forEach(function (singleCookie, i, arr) {
            splitedCookies.push(cookies[i].split('='));
        });
        var result = '';
        splitedCookies.forEach(function (splitedOneCookie, i, arr) {
            if (splitedOneCookie[0] === 'current_user_id' || splitedOneCookie[0] === ' current_user_id') {
                result = splitedOneCookie[1];
            }
        });
        return result;
    }
});
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)
