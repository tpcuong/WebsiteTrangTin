<<<<<<< HEAD

$(document).ready(function () {
=======
$(document).ready(function () {

    // ================================================
    // === 1. LOGIC TRANG CHI TIẾT (QUICK NAV, CHART, FLASH)
    // ================================================

    // --- 1.1. Ẩn/hiện mục "Xem nhanh" ---
>>>>>>> 97656b2 (Fix Code and update admin)
    var quickNav = $('.quick-nav h3');
    if (quickNav.length > 0) {
        quickNav.on('click', function () {
            $(this).next('ul').slideToggle();
        });
    }

<<<<<<< HEAD
=======
    // --- 1.2. Cuộn mượt khi nhấn "Xem nhanh" ---
>>>>>>> 97656b2 (Fix Code and update admin)
    var quickNavLinks = $('.quick-nav ul li a');
    if (quickNavLinks.length > 0) {
        quickNavLinks.on('click', function (event) {
            event.preventDefault();
            var targetId = $(this).attr('href');
            var targetElement = $(targetId);
            if (targetElement.length) {
                var headerHeight = $('.header').outerHeight() || 0;
<<<<<<< HEAD
                $('html, body').animate({
                    scrollTop: targetElement.offset().top - headerHeight - 15
                }, 800);
            }
        });
    }
=======
                var menuHeight = $('.main-menu').outerHeight() || 0;
                $('html, body').animate({
                    scrollTop: targetElement.offset().top - headerHeight - menuHeight - 20
                }, 500); 
            }
        });
    }

    // --- 1.3. Hiển thị thông báo (Flash Message) ---
>>>>>>> 97656b2 (Fix Code and update admin)
    var flashMessage = $('body').data('flash-message');
    if (flashMessage) {
        alert(flashMessage);
        $('body').removeAttr('data-flash-message');
    }
<<<<<<< HEAD
=======

    // --- 1.4. Vẽ biểu đồ (Chart.js) ---
>>>>>>> 97656b2 (Fix Code and update admin)
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

<<<<<<< HEAD
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
    // Xử lý form liên hệ
    const contactForm = document.querySelector('.contact-form form');
    if (contactForm) {
        contactForm.addEventListener('submit', function (event) {
            const name = contactForm.querySelector('input[name="name"]');
            const email = contactForm.querySelector('input[name="email"]');
            const message = contactForm.querySelector('textarea[name="message"]');

            if (name.value.trim() === '' || email.value.trim() === '' || message.value.trim() === '') {
=======
    // ================================================
    // === 2. LOGIC VALIDATION (TÌM KIẾM & LIÊN HỆ)
    // ================================================
    
    // --- 2.1. Validation Form Tìm kiếm ---
    $('form.search-box').on('submit', function (event) {
        var input = $(this).find('input[name="q"]');
        if (input.val().trim() === '') {
            event.preventDefault();
            alert('Vui lòng nhập từ khóa tìm kiếm!');
            input.focus();
        }
    });

    // --- 2.2. Validation Form Liên hệ ---
    var contactForm = $('.contact-form form');
    if (contactForm.length > 0) {
        contactForm.on('submit', function (event) {
            const name = contactForm.find('input[name="name"]');
            const email = contactForm.find('input[name="email"]');
            const message = contactForm.find('textarea[name="message"]');

            if (name.val().trim() === '' || email.val().trim() === '' || message.val().trim() === '') {
>>>>>>> 97656b2 (Fix Code and update admin)
                event.preventDefault(); // Ngăn gửi form
                alert('Vui lòng điền đầy đủ Họ tên, Email và Nội dung liên hệ!');
            }
        });
    }

<<<<<<< HEAD
});

=======
    // ================================================
    // === 3. LOGIC LOGIN MODAL (AJAX)
    // ================================================

    // --- 3.1. Tìm các phần tử Modal ---
    var modalOverlay = $('#login-modal-overlay');
    var showButton = $('#show-login-modal');
    var closeButton = $('#close-login-modal');
    var loginForm = $('#login-modal-form');
    var errorMessage = $('#login-error-message');

    // --- 3.2. Mở Modal ---
    showButton.on('click', function(e) {
        e.preventDefault(); // Ngăn link chuyển trang
        modalOverlay.css('display', 'flex'); // Hiển thị modal
    });

    // --- 3.3. Đóng Modal ---
    function closeModal() {
        modalOverlay.css('display', 'none'); // Ẩn modal
        errorMessage.css('display', 'none').text(''); // Xóa thông báo lỗi
    }
    closeButton.on('click', closeModal);
    modalOverlay.on('click', function(e) {
        // Chỉ đóng khi click vào nền mờ (overlay), không phải vào content
        if (e.target === modalOverlay[0]) {
            closeModal();
        }
    });

    // --- 3.4. Xử lý Form Đăng nhập bằng AJAX ---
    loginForm.on('submit', function(e) {
        e.preventDefault(); // Ngăn form gửi đi theo cách truyền thống

        var username = $('#modal-username').val();
        var password = $('#modal-password').val();

        $.ajax({
            type: "POST",
            url: "admin/ajax_login.php", // File PHP xử lý ngầm
            data: {
                username: username,
                password: password
            },
            dataType: "json", 
            success: function(response) {
                if (response.success) {
                    location.reload(); // Tải lại trang
                } else {
                    errorMessage.text(response.message);
                    errorMessage.css('display', 'block');
                }
            },
            error: function() {
                errorMessage.text('Không thể kết nối đến máy chủ. Vui lòng thử lại.');
                errorMessage.css('display', 'block');
            }
        });
    });

    // ================================================
    // === 4. LOGIC LOGOUT (AJAX)
    // ================================================
    $('#ajax-logout-button').on('click', function(e) {
        e.preventDefault(); // 1. Ngăn link chuyển trang
        
        $.ajax({
            type: "POST",
            url: "admin/ajax_logout.php", // 2. Gọi file PHP ngầm
            dataType: "json",
            success: function(response) {
                // 3. Đăng xuất thành công, tải lại trang
                if (response.success) {
                    location.reload();
                }
            },
            error: function() {
                // Lỗi server, cứ tải lại trang
                location.reload();
            }
        });
    });

});

/*
================================
== 5. LOGIC CHO THANH TRƯỢT MENU (MỚI)
================================
*/
$(document).ready(function() {

    // Hàm di chuyển thanh trượt
    function moveMenuSlider(target) {
        var menu = $('.main-menu ul');
        var slider = menu.find('.menu-slider');
        
        // Chỉ chạy nếu thanh trượt tồn tại
        if (slider.length === 0 || target.length === 0) {
            return;
        }

        // Lấy vị trí của <li> chứa <a>
        var targetLi = target.parent('li'); 
        
        // Tính toán vị trí
        var leftPos = targetLi.position().left + (menu.scrollLeft() || 0);
        var widthPos = targetLi.outerWidth();

        // Animate thanh trượt
        slider.css({
            'left': leftPos + 'px',
            'width': widthPos + 'px'
        });
    }

    // 1. Di chuyển đến mục "active" khi tải trang
    var activeLink = $('.main-menu a.active');
    moveMenuSlider(activeLink);

    // 2. Di chuyển khi di chuột (hover) vào
    $('.main-menu a').on('mouseenter', function() {
        moveMenuSlider($(this));
    });

    // 3. Quay về mục "active" khi chuột rời khỏi menu
    $('.main-menu').on('mouseleave', function() {
        moveMenuSlider($('.main-menu a.active'));
    });

    // 4. Cập nhật lại vị trí khi thay đổi kích thước cửa sổ
    $(window).on('resize', function() {
        moveMenuSlider($('.main-menu a.active'));
    });

});
>>>>>>> 97656b2 (Fix Code and update admin)
