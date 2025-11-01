
$(document).ready(function () {
    var quickNav = $('.quick-nav h3');
    if (quickNav.length > 0) {
        quickNav.on('click', function () {
            $(this).next('ul').slideToggle();
        });
    }

    var quickNavLinks = $('.quick-nav ul li a');
    if (quickNavLinks.length > 0) {
        quickNavLinks.on('click', function (event) {
            event.preventDefault();
            var targetId = $(this).attr('href');
            var targetElement = $(targetId);
            if (targetElement.length) {
                var headerHeight = $('.header').outerHeight() || 0;
                $('html, body').animate({
                    scrollTop: targetElement.offset().top - headerHeight - 15
                }, 800);
            }
        });
    }
    var flashMessage = $('body').data('flash-message');
    if (flashMessage) {
        alert(flashMessage);
        $('body').removeAttr('data-flash-message');
    }
    var charts = $('.js-chart');
    if (charts.length > 0 && typeof Chart !== 'undefined') {
        charts.each(function () {
            var ctx = this.getContext('2d');
            var labels = $(this).data('labels');
            var datasets = $(this).data('datasets');

            if (labels && datasets) {
                new Chart(ctx, {
                    type: "bar",
                    data: {
                        labels: labels,
                        datasets: datasets
                    },
                    options: {
                        indexAxis: "y",
                        responsive: true,
                        plugins: { legend: { position: "top" } },
                        scales: {
                            x: { beginAtZero: true }
                        }
                    }
                });
            }
        });
    }

});

document.addEventListener("DOMContentLoaded", function () {

    const allSearchForms = document.querySelectorAll('form.search-box');

    allSearchForms.forEach(form => {
        form.addEventListener('submit', function (event) {

            const input = form.querySelector('input[name="q"]');

            if (input.value.trim() === '') {
                event.preventDefault();
                alert('Vui lòng nhập từ khóa tìm kiếm!');

                input.focus();
            }
        });
    });

});