document.addEventListener('DOMContentLoaded', function() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    let users = JSON.parse(localStorage.getItem('users')) || [];
    let currentUser = JSON.parse(localStorage.getItem('currentUser')) || null;

    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', function() {
            if (!currentUser) {
                alert('Будь ласка, увійдіть до свого аккаунту, щоб додати товари до кошика.');
                return;
            }
            const productId = this.dataset.productId;
            const product = {
                id: productId,
                name: this.parentElement.querySelector('h2').innerText,
                price: parseFloat(this.parentElement.querySelector('p').innerText.replace('Ціна: $', ''))
            };
            cart.push(product);
            localStorage.setItem('cart', JSON.stringify(cart));
            alert(`${product.name} додано до кошика!`);
        });
    });

    if (window.location.pathname.includes('cart.html')) {
        const cartItemsContainer = document.getElementById('cart-items');
        const totalAmount = document.getElementById('total-amount');
        let total = 0;
        cart.forEach(product => {
            const productDiv = document.createElement('div');
            productDiv.classList.add('cart-item');
            productDiv.innerHTML = `<h2>${product.name}</h2><p>Ціна: $${product.price}</p>`;
            cartItemsContainer.appendChild(productDiv);
            total += product.price;
        });
        totalAmount.innerText = total.toFixed(2);
    }

    if (window.location.pathname.includes('product')) {
        const productId = window.location.pathname.split('.')[0].replace('/product', '');
        const reviewList = document.getElementById('review-list');
        const reviewForm = document.getElementById('review-form');

        const reviews = JSON.parse(localStorage.getItem(`reviews-${productId}`)) || [];

        reviews.forEach(review => {
            const reviewDiv = document.createElement('div');
            reviewDiv.classList.add('review');
            review
