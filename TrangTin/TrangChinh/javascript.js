// Khởi tạo Swiper cho Tin tức nổi bật
const newsSwiper = new Swiper('.news-swiper', {
  slidesPerView: 3,
  spaceBetween: 30,
  loop: true,
  navigation: {
    nextEl: '.news-section .swiper-button-next',
    prevEl: '.news-section .swiper-button-prev',
  },
  pagination: {
    el: '.news-section .swiper-pagination',
    clickable: true,
  },
  breakpoints: {
    320: { slidesPerView: 1, spaceBetween: 15 },
    640: { slidesPerView: 2, spaceBetween: 20 },
    992: { slidesPerView: 3, spaceBetween: 30 },
  },
});

// Khởi tạo Swiper cho Đánh giá sản phẩm
const reviewsSwiper = new Swiper('.reviews-swiper', {
  slidesPerView: 3,
  spaceBetween: 30,
  loop: true,
  navigation: {
    nextEl: '.reviews-section .swiper-button-next',
    prevEl: '.reviews-section .swiper-button-prev',
  },
  pagination: {
    el: '.reviews-section .swiper-pagination',
    clickable: true,
  },
  breakpoints: {
    320: { slidesPerView: 1, spaceBetween: 15 },
    640: { slidesPerView: 2, spaceBetween: 20 },
    992: { slidesPerView: 3, spaceBetween: 30 },
  },
});
