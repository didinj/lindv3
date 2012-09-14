

/* DEFAULT ===================================*/
/*============================================*/

if (typeof jQuery !== 'undefined') {
    (function($) {
        $('#spinner').ajaxStart(function() {
            $(this).fadeIn();
        }).ajaxStop(function() {
            $(this).fadeOut();
        });
    })(jQuery);
}


/* @omipit ===================================*/
/*============================================*/

$(document).ready(function(){
$('#leftfinderspace').slides({
	preload: true,
	effect: 'slide',
	crossfade: true,
	preloadImage: 'images/spinner.gif',
	paginationClass: 'control-slide-detail',
	play: 0,
	pause: 0,
	hoverPause: true
});
});	

$(document).ready(function() {
	$('#nav li:has(ul)').addClass('arrow-down');
});