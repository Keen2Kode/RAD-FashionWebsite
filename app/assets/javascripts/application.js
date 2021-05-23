// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require jquery
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets


$(document).ready(function () {
    $('[data-toggle=offcanvas]').click(function () {
        $('.row-offcanvas').toggleClass('active');
    });
});

// this is for the footer
var didScroll;
var lastScrollTop = 0;
var delta = 0;
var navbarHeight = $('footer').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();
    
    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
        return;
    
    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('footer').removeClass('nav-down').addClass('nav-up');
    } else {
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
            $('footer').removeClass('nav-up').addClass('nav-down');
        }
    }
    
    lastScrollTop = st;
}

$(document).ready(function () {
    $("select#bag_item_size").change(function(){
        var selected_size = $(this).val();
        var selected_colour = $("select#bag_item_colour").val();
        var item_id = $("#bag_item_item_id").val()

        $.ajax({
            url: "/items/" + item_id + "/get_colours",
            method: "GET",  
            dataType: "json",
            data: { 
                size: selected_size
            },
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                if (response.includes(selected_colour)) {
                    $("#add-to-bag-submit").prop('disabled', false);
                    $("#available-colour-size-combination").empty();
                } else {
                    $("#add-to-bag-submit").prop('disabled', true);
                    $("#available-colour-size-combination").text('Sorry, for '+selected_size+', only '+response+' are available');
                }
            }
        });
    });
    
    $("select#bag_item_colour").change(function(){
        var selected_colour = $(this).val();
        var selected_size = $("select#bag_item_size").val();
        var item_id = $("#bag_item_item_id").val()

        $.ajax({
            url: "/items/" + item_id + "/get_sizes",
            method: "GET",  
            dataType: "json",
            data: { 
                colour: selected_colour
            },
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                if (response.includes(selected_size)) {
                    $("#add-to-bag-submit").prop('disabled', false);
                    $("#available-colour-size-combination").text('In stock');
                } else {
                    $("#add-to-bag-submit").prop('disabled', true);
                    $("#available-colour-size-combination").text('Sorry, for '+selected_colour+', only '+response+' are available');
                }
            }
        });
    });

    
});