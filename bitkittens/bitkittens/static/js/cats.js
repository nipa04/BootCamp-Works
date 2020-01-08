document.addEventListener("DOMContentLoaded", function() {

    const summonBtn = document.querySelector('.summon-cats');
    const catBoxes = document.querySelectorAll('.cat-box');


    summonBtn.addEventListener('click', () => {
        console.log('Summon Kittens button was clicked');
        axios.get('http://bitkittens.herokuapp.com/cats.json')
            .then((response) => {
              // console.log(response)
                const catList = response.data.cats;
                catBoxes.forEach((box, i) => {
                    box.innerHTML = '';
                    const catImage = document.createElement('img');
                    catImage.src = catList[i].photo;
                    catImage.alt = `Photo of ${ catList[i].name }`;
                    box.appendChild(catImage);

                });
             });
    });
});
