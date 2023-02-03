const showCartButton = document.getElementById("showCartButton");
    const showFavoritesButton = document.getElementById("showFavoritesButton");
    const cdList = document.getElementById("cdList");
    let cart = [];
    let favorites = [];

    const CDs = [
    {
        name: "Album 1",
        artist: "Artist 1",
        price: 19.99
    },
    {
        name: "Album 2",
        artist: "Artist 2",
        price: 24.99
    },
    {
        name: "Album 3",
        artist: "Artist 3",
        price: 14.99
    }
];


CDs.forEach(function(cd) {
const listItem = document.createElement("li");
listItem.innerHTML = `
    <p>Nome do CD: ${cd.name}</p>
    <p>Artista: ${cd.artist}</p>
    <p>Preço: $${cd.price}</p>
    <button id="buyButton-${cd.name}">Comprar</button>
    <button id="addToCartButton-${cd.name}">Adicionar ao Carrinho</button>
    <button id="favoriteButton-${cd.name}">Favoritar</button>
`;

const buyButton = listItem.querySelector(`#buyButton-${cd.name}`);
buyButton.addEventListener("click", function() {
    alert(`Você comprou o CD "${cd.name}" por $${cd.price}.`);
});

const addToCartButton = listItem.querySelector(`#addToCartButton-${cd.name}`);
addToCartButton.addEventListener("click", function() {
    cart.push(cd);
    alert(`Você adicionou o CD "${cd.name}" ao carrinho.`);
});

const favoriteButton = listItem.querySelector(`#favoriteButton-${cd.name}`);
favoriteButton.addEventListener("click", function() {
    favorites.push(cd);
    alert(`Você adicionou o CD "${cd.name}" aos favoritos.`);
});

cdList.appendChild(listItem);
});

showCartButton();